class MakersBnb < Sinatra::Base

  get '/sessions/new' do
    erb :'sessions/log_in'
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
    session.delete(:user_id)
    redirect '/listings'
  end

end
