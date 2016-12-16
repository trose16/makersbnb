class MakersBnb < Sinatra::Base

  get "/users/new" do
    if current_user
      redirect "/listings"
    else
      erb :'users/sign_up'
    end
  end

  post "/users" do
    User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirm] )
    redirect '/listings'
  end

  get "/users/requests" do
    if current_user
      @renter_bookings = current_user.bookings
      @owner_bookings = current_user.listings.bookings
      erb :'users/requests'
    else
      redirect "/users/new"
    end
  end

end
