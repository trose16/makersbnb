require 'data_mapper'
require 'dm-postgres-adapter'

class Request

  include DataMapper::Resource

  property :id, Serial

  belongs_to :user
  belongs_to :listing


end
