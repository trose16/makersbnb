

class MakersBnb < Sinatra::Base

  get "/users/new" do
    erb :'users/sign_up'
  end

  post "/users" do
    User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirm] )
    redirect '/listings'
  end

  get "/users/requests" do
    hello world
  end

  get "/users/listings" do
    'Peacock Paradise Private Villa'
  end

end
