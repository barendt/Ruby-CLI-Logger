class DispatcherActionNotFoundError < StandardError
end

class Dispatcher

  def initialize(command)
    @valid_actions = "log search".split
    @command = command
    parse_action
  end

  def dispatch
  end

  private
  def parse_action
    @action = @command.split[0].downcase.strip
    raise DispatcherActionNotFoundError unless @valid_actions.include?(@action)
  end
end
