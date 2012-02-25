require 'sequel'

class Entry

  def initialize(entry)
    @entry = entry
  end

  def save
    db = get_db_handle
    db[:items].insert(:entry => @entry)
  end

  private
  def get_db_handle
    Sequel.sqlite(Dir.home + "/.rcl/rcl.sqlite")
  end

end
