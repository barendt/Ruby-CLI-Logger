require 'spec_helper'

describe Item do

  context 'creation' do

    # TODO: Find a better way to do this.
    before(:all) do
      db = Sequel.sqlite
      Item.db = db
      db.create_table :items do
        primary_key :id
        Text :entry
        DateTime :logged_at, :default => Sequel::CURRENT_TIMESTAMP
      end
    end

    it 'can be created' do
      Item.create(:entry => Time.now.to_i)
    end

    it 'requires an entry' do
      lambda {Item.create(:entry => nil)}.should raise_error(Sequel::ValidationFailed)
    end

  end

end
