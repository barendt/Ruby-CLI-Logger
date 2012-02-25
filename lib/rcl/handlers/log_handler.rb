require 'rcl/entry'

class LogHandler

  def initialize(args)
    @args = args
  end

  def handle
    Entry.new(@args.join(" ")).save
  end

end
