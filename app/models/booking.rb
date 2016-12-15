require 'data_mapper'
require 'dm-postgres-adapter'

class Booking

  include DataMapper::Resource

  property :id, Serial
  property :accepted, Boolean

  belongs_to :user
  belongs_to :listing


end
