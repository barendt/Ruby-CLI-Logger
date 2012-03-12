class DbHelper

  def self.get_db_connection
    Sequel.sqlite(Dir.home + "/.rcl/rcl.sqlite")
  end

  def self.create_schema(db)
    db.create_table :items do
      primary_key :id
      Text :entry
      DateTime :logged_at, :default => Sequel::CURRENT_TIMESTAMP
    end
  end

end
