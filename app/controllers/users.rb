

class MakersBnb < Sinatra::Base

  get "/users/new" do
    erb :sign_up
  end

  post "/users" do
    User.create(name: params[:name], email: params[:email], password: params[:password])
  end

end
