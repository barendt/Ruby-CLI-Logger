require 'rcl/handlers/display_handler.rb'
require 'rcl/handlers/log_handler.rb'
require 'rcl/handlers/setup_handler.rb'

class DispatcherActionNotFoundError < StandardError
end

class Dispatcher

  def initialize(options, entry=nil)
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
    if @options[:action] == 'log'
      LogHandler.new(@options, @entry).handle
    else
      handler_class = "#{@action.capitalize}Handler"
      Object.const_get(handler_class).new(@options).handle
    end
  end

  private
  def first_run?
    !File.exists?(Dir.home + "/.rcl")
  end

  def validate_action
    raise DispatcherActionNotFoundError unless @valid_actions.include?(@action)
  end
end
