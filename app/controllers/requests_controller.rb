class MakersBnb < Sinatra::Base

	post '/requests/:id/confirm' do
		@booking = Booking.first( id: params[:id] )
		@booking.update(accepted: true)
		redirect '/requests/confirm'
	end

	get '/requests/confirm' do
		erb :'requests/confirm'
	end

	get '/requests/deny' do
		erb :'requests/deny'
	end	

end
