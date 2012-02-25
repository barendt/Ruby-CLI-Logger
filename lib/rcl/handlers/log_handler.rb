require 'rcl/item'

class LogHandler

  def initialize(entry)
    @entry = entry
  end

  def handle
    item = Item.create(:entry => @entry)
  end

end
