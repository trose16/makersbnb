require 'data_mapper'
require 'dm-postgres-adapter'

class Booking

  include DataMapper::Resource

  property :id, Serial
  property :status, String, default: "pending"
  property :book_from, String
  property :book_to, String
  property :date_availability, Object

  belongs_to :user
  belongs_to :listing

  def set_date_availability
    date_from = Date.parse(self.book_from)
    date_to = Date.parse(self.book_to)
    self.date_availability = (date_from..date_to).map(&:to_s)
  end


end
