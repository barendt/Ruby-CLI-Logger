class DbHelper

  def self.get_db_connection
    Sequel.sqlite(Dir.home + "/.rcl/rcl.sqlite")
  end

end
