require 'rcl'

RSpec.configure do |config|
  config.around(:each) do
    db = Sequel.sqlite
    Item.db = db
    DbHelper.create_schema(db)
  end
end
