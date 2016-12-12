require 'data_mapper'
require 'dm-postgres-adapter'

# require models here
require_relative 'models/listing'

DataMapper.setup(:default, "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
