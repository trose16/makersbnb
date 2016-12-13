module Helpers

# helper methods for controllers here
	def current_user
		@current_user ||= User.get(session[:user_id])
	end

end
