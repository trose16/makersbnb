require 'data_mapper'
require 'dm-postgres-adapter'

class Listing

	include DataMapper::Resource

	property :id, Serial
	property :name, Text, required: true
	property :description, Text, required: true
	property :price, String, required: true
	property :available_from, String
	property :available_until, String
	property :country, String, required: true
	property :city, String, required: true

	belongs_to :user
	has n, :requests

end
