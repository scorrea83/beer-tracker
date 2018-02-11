class BeersController < ApplicationController

  get '/beers' do
    erb :"beers/beers"
  end

  get '/beers/:id' do
    @beer = Beer.find(params[:id])
    erb :"beers/show_beer"
  end

end
