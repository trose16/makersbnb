class MakersBnb < Sinatra::Base

	get '/listings/new' do
		current_user ? (erb :'listings/new') : (redirect '/users/new')
	end

	post '/listings/add' do
		@listing = Listing.create(name: params[:name],
								description: params[:description],
								price: params[:price],
								city: params[:city],
								country: params[:country],
								available_from: params[:available_from],
								available_until: params[:available_until],
								user_id: current_user.id)
		@listing.set_date_availability
		@listing.save
		redirect '/listings'

	end

	get '/listings' do
		@listings = Listing.all
		erb :'listings/index'
	end

	get '/listings/:id' do
		@listing = Listing.first( id: params[:id] )
		erb :'listings/detail'
	end

	post '/listings/:id/request' do
		@listing = Listing.first( id: params[:id] )

		if @listing.check_availability( params[:book_from], params[:book_to] )
			@booking = Booking.create(user_id: current_user.id, listing_id: params[:id] )
			redirect "/users/requests"
		else
			flash.keep[:notice] = "Sorry, the dates are not available."
			redirect '/listings'
		end

	end

end
