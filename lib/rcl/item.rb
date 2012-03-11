require 'rcl/db_helper'
require 'sequel'

DB = DbHelper.get_db_connection
class Item < Sequel::Model
end
