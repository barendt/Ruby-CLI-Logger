require 'spec_helper'

describe Item do

  context 'creation' do

    it 'can be created' do
      i = Item.create(:entry => Time.now.to_i)
      i.id.should_not be nil
    end

    it 'requires an entry' do
      lambda {Item.create(:entry => nil)}.should raise_error(Sequel::ValidationFailed)
    end

  end

end
