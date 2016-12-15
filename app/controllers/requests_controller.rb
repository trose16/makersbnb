class MakersBnb < Sinatra::Base

	get '/requests/confirm' do
		erb :'requests/confirm'
	end

	get '/requests/deny' do
		erb :'requests/deny'
	end	

end
