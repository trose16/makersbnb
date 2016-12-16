class MakersBnb < Sinatra::Base

  get '/sessions/new' do
    current_user ? (redirect "/listings") : (erb :'sessions/log_in')
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/listings'
    else
      flash.keep[:log_in_error] = "Oops! Something went wrong. Please try again."
      redirect '/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id]  = nil
    redirect '/listings'
  end

end
