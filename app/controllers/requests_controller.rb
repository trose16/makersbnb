class MakersBnb < Sinatra::Base

	post '/requests/:id/confirm' do
		@booking = Booking.first( id: params[:id] )
		@booking.update(status: "accepted")
		redirect '/requests/confirm'
	end

	get '/requests/confirm' do
		erb :'requests/confirm'
	end

	post '/requests/:id/deny' do
		@booking = Booking.first( id: params[:id] )
		@booking.update(status: "rejected")
		redirect '/requests/deny'
	end

	get '/requests/deny' do
		erb :'requests/deny'
	end	

end
