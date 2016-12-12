

class MakersBnb < Sinatra::Base

  get '/sessions/new' do
    erb :log_in
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      redirect '/listings'
    else
      redirect '/sessions/new'
    end
  end

end
