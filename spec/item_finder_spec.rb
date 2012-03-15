require 'spec_helper'

describe ItemFinder do

  before(:all) do
    db = Sequel.sqlite
    Item.db = db
    DbHelper.create_schema(db)

    Item.create(:entry => Time.now.to_i)
    Item.create(:entry => Time.now.to_i)
    Item.create(:entry => Time.now.to_i)
  end

  it 'finds items created today' do
    ItemFinder.new.on('today').should have(3).things
  end

end
