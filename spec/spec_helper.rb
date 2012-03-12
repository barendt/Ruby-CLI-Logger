require 'rcl'

RSpec.configure do |config|
  config.around(:each) do
    db = Sequel.sqlite
    Sequel::Model.db = db
    DbHelper.create_schema(db)
  end
end
