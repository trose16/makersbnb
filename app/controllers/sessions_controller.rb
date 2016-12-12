

class MakersBnb < Sinatra::Base

  get '/sessions/new' do
    erb :log_in
  end

  post '/sessions' do
    redirect '/listings'
  end

end
