class MakersBnb < Sinatra::Base

	post '/requests/:id/confirm' do
		@booking = Booking.first( id: params[:id] )
		@booking.update(status: "accepted")
		listing_id = @booking.listing_id
		@listing = Listing.first(id: listing_id)
		availability = @listing.date_availability
		updated_dates = availability - @booking.date_availability
		@listing.update(date_availability: updated_dates)
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
