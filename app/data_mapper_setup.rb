require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/user.rb'
require_relative 'models/listing'
require_relative 'models/request'


DataMapper.setup(:default, "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
