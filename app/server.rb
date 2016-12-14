class MakersBnb < Sinatra::Base

	enable :sessions
	set :session_secret, 'Super secret'
	register Sinatra::Flash
	use Rack::MethodOverride
	register Sinatra::Partial

	set :partial_template_engine, :erb
	enable :partial_underscores

	include Helpers

end
