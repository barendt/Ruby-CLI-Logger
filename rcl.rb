#!/usr/bin/env ruby

require './rcl/dispatcher.rb'

begin
  Dispatcher.new('log some stuff').dispatch
rescue DispatcherActionNotFoundError
  puts "Sorry, that's an invalid action."
end
