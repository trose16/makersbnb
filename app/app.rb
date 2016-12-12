ENV['RACK_ENV']||="development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'server'
require_relative 'helpers'

require_relative './controllers/users'
require_relative 'controllers/listings_controller.rb'

