class MakersBnb < Sinatra::Base

	enable :sessions
	set :session_secret, 'Super secret'
	register Sinatra::Flash

end
