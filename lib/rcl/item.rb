require 'sequel'

DB = Sequel.sqlite(Dir.home + "/.rcl/rcl.sqlite")
class Item < Sequel::Model
end
