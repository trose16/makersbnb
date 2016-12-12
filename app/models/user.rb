require 'bcrypt'

class User

include DataMapper::Resource

property :id, Serial
property :name, String
property :email, String
property :password_digest, Text, :required => true

attr_accessor :password_confirmation
attr_reader :password

validates_presence_of :email
validates_presence_of :password
validates_format_of :email, :as => :email_address
validates_confirmation_of :password

def password=(password)
  @password = password
  self.password_digest = BCrypt::Password.create(password)
end

end
