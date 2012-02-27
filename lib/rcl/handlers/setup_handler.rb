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
    db.create_table :items do
      primary_key :id
      Text :entry
      DateTime :logged_at, :default => Sequel::CURRENT_TIMESTAMP
    end
  end

  def setup_rcl_directory
    Dir::mkdir @rcl_root
  end

end
