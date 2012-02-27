require 'rcl/handlers/display_handler.rb'
require 'rcl/handlers/log_handler.rb'
require 'rcl/handlers/setup_handler.rb'

class DispatcherNotEnoughArgumentsError < StandardError
end

class DispatcherActionNotFoundError < StandardError
end

class Dispatcher

  def initialize(options, entry=nil)
    #raise DispatcherNotEnoughArgumentsError if args.count == 0
    @valid_actions = "log display".split
    @action = options[:action]
    @options = options
    @entry = entry
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

  def self.help
    return "rcl: Try 'rcl help' for more information."
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
