require 'rcl/handlers/log_handler.rb'
require 'rcl/handlers/setup_handler.rb'

class DispatcherActionNotFoundError < StandardError
end

class Dispatcher

  def initialize(args)
    @valid_actions = "log search".split
    @action = args[0]
    @args = args[1]
    validate_action
  end

  def dispatch
    if first_run?
      SetupHandler.new.handle
    end
    handler_class = "#{@action.capitalize}Handler"
    Object.const_get(handler_class).new(@args).handle
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
