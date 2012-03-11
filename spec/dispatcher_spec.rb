require 'spec_helper'

describe Dispatcher do

  it 'errors on actions that are invalid' do
    opts = {:action => 'll'}
    lambda {Dispatcher.new(opts, "something")}.should raise_error(DispatcherActionNotFoundError)
  end
end
