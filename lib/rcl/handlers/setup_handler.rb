require 'sequel'

class SetupHandler

  def initialize
    @rcl_root = Dir.home + "/.rcl"
  end

  def handle
    setup_rcl_directory
    create_new_database
  end

  private
  def create_new_database
    db = Sequel.sqlite(@rcl_root + "/rcl.sqlite")
    DbHelper.create_schema(db)
  end

  def setup_rcl_directory
    Dir::mkdir @rcl_root
  end

end
