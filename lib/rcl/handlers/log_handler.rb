require 'rcl/entry'

class LogHandler

  def initialize(entry)
    @entry = entry
  end

  def handle
    Entry.new(@entry).save
  end

end
