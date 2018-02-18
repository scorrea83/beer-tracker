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
    elsif !params[:brewery_id].empty?
      @brewery = brewery
      erb :'experiences/create_experience', locals: {message: "brewery located/created"}
    elsif params[:new_brewery].none? {|key, value| value == ""}
      # @brewery.save = new_brewery
      session[:new_brewery] = new_brewery
      redirect '/beers/new'
      # erb :'experiences/create_experience', locals: {message: "brewery located/created"}
    else
      flash[:message] = "Sorry, to continue you must either select a brewery from the dropdown list OR add new brewery information to create new brewery."
      if !new_brewery.valid?
        @errors = new_brewery.errors.full_messages
      end
      erb :'experiences/create_experience'
    end
  end



  get '/experiences/:id' do
    @experience = Experience.find(params[:id])
    erb :'experiences/show_experience'
  end



end
