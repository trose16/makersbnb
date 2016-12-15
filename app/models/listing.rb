require 'data_mapper'
require 'dm-postgres-adapter'
require 'date'

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
	property :date_availability, Object

	belongs_to :user
	has n, :bookings

	def set_date_availability
		date_from = Date.parse(self.available_from)
		date_to = Date.parse(self.available_until)
		self.date_availability = (date_from..date_to).map(&:to_s)
	end



end
