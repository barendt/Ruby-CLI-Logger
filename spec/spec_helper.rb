require 'rcl'

RSpec.configure do |config|
  config.around(:each) do
    db = Sequel.sqlite
    Item.db = db
    db.create_table :items do
      primary_key :id
      Text :entry
      DateTime :logged_at, :default => Sequel::CURRENT_TIMESTAMP
    end
  end
end
