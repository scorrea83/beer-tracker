class BreweriesController < ApplicationController

  get '/breweries' do
      erb :'breweries/breweries'
  end

  get '/breweries/:slug' do
    @brewery = Brewery.find_by_slug(params[:slug])
    erb :'breweries/show_brewery'
  end

end
