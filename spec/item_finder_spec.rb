require 'spec_helper'

describe ItemFinder do

  before(:all) do
    db = Sequel.sqlite
    Item.db = db
    DbHelper.create_schema(db)

    Item.create(:entry => Time.now.to_i)
    Item.create(:entry => Time.now.to_i)
    Item.create(:entry => Time.now.to_i)
    Item.create(:entry => "Buy milk at the store.")
  end

  it 'finds items created today' do
    ItemFinder.new.on('today').should have(4).things
  end

  it 'finds items based on a partial search string' do
    ItemFinder.new.like('milk').should have(1).things
  end

end
