require 'rack-flash'

class ExperiencesController < ApplicationController
  use Rack::Flash

  get '/experiences' do
    erb :'experiences/experiences'
  end

  get '/experiences/new' do
    erb :'experiences/create_experience'
  end

  post '/experiences/new/brewery' do
    brewery = Brewery.find_by(id: params[:brewery_id])
    new_brewery = Brewery.new(params[:new_brewery])

  end



  get '/experiences/:id' do
    @experience = Experience.find(params[:id])
    erb :'experiences/show_experience'
  end



end
