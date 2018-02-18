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
    binding.pry
    if !params[:brewery_id].empty? && params[:new_brewery].none? {|key, value| value == ""}
      flash[:message] = "Sorry, to continue you must either select a brewery from the dropdown list OR add new brewery information to create new brewery."
      redirect 'experiences/new'

    end
  end



  get '/experiences/:id' do
    @experience = Experience.find(params[:id])
    erb :'experiences/show_experience'
  end



end
