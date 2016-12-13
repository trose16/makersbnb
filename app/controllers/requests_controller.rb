

class MakersBnb < Sinatra::Base

  get '/request/new' do
    @listing = Listing.first(id: sessions[:listing_id])
    erb :'requests/new'
  end

end
