class MakersBnb < Sinatra::Base

  get '/sessions/new' do
    erb :log_in
  end

  post '/sessions' do
    if @user = User.authenticate(params[:email], params[:password])
      session[:user_id] = @user.id
      redirect '/listings'
    else
      redirect '/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    redirect '/listings'
  end

end
