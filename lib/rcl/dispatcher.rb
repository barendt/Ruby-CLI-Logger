require 'rcl/handlers/display_handler.rb'
require 'rcl/handlers/log_handler.rb'
require 'rcl/handlers/setup_handler.rb'

class DispatcherActionNotFoundError < StandardError
end

class Dispatcher

  def initialize(options, args=nil)
    @valid_actions = "log display".split
    @action = options[:action]
    @options = options
    @entry = args.first if !args.nil?
    validate_action
  end

  def dispatch
    if first_run?
      SetupHandler.new.handle
    end
    handler_class = "#{@action.capitalize}Handler"
    if @options[:action] == 'log'
      LogHandler.new(@options, @entry).handle
    else
      Object.const_get(handler_class).new(@options).handle
    end
  end

  private
  def first_run?
    !File.exists?(Dir.home + "/.rcl")
  end

  def parse_action
    @action = @command.split[0].downcase.strip
  end

  def validate_action
    raise DispatcherActionNotFoundError unless @valid_actions.include?(@action)
  end
end
