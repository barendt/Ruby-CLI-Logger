require 'spec_helper'

describe Dispatcher do

  it 'catches actions that are invalid' do
    lambda {Dispatcher.new(["!log", "something"])}.should raise_error(DispatcherActionNotFoundError)
  end

end
