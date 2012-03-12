require 'spec_helper'

describe Item do

  context 'creation' do

    it 'can be created' do
      Item.create(:entry => Time.now.to_i)
    end

    it 'requires an entry' do
      lambda {Item.create(:entry => nil)}.should raise_error(Sequel::ValidationFailed)
    end

  end

end
