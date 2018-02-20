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
    if !params[:brewery_id].empty? && params[:new_brewery].none? {|key, value| value == ""}
      flash[:message] = "Sorry, to continue you must either select a brewery from the dropdown list OR add new brewery information to create new brewery."
      redirect 'experiences/new'
    elsif !params[:brewery_id].empty?
      @brewery = brewery
      erb :'experiences/create_experience', locals: {message: "brewery located/created"}
    elsif params[:new_brewery].none? {|key, value| value == ""}
      if new_brewery.valid?
        new_brewery.save
        @brewery = new_brewery
      else
        @brewery = Brewery.find_by(name: params[:new_brewery][:name])
      end
      erb :'experiences/create_experience', locals: {message: "brewery located/created"}
    else
      flash[:message] = "Sorry, to continue you must either select a brewery from the dropdown list OR add new brewery information to create new brewery."
      if !new_brewery.valid?
        @errors = new_brewery.errors.full_messages
        @errors.map! {|error| "New Brewery #{error}"}
      end
      erb :'experiences/create_experience'
    end
  end

  post '/experiences/new/beer' do
    @brewery = Brewery.find_by(id: params[:brewery_id])
    beer = Beer.find_by(id: params[:beer_id])
    @new_style = Style.new(name: params[:style_name])
    new_beer = Beer.new(params[:beer])
    new_beer.brewery = @brewery

    if !params[:beer_id].empty? && params[:beer].any? {|key, value| value != ""}
      flash[:message] = "Sorry, to continue you must either select a beer from the dropdown list OR add new beer information to create new beer."
      erb :'experiences/create_experience', locals: {message: "brewery located/created"}
    elsif !params[:beer_id].empty?
      @beer = beer
      erb :'experiences/create_experience', locals: {message: "beer located/created"}
    else
      flash[:message] = "Sorry, to continue you must either select a beer from the dropdown list OR add new beer information to create new beer."
      if !new_beer.valid?
        @errors = new_beer.errors.full_messages
        @errors.map! {|error| "New Beer #{error}"}
      end
      erb :'experiences/create_experience', locals: {message: "brewery located/created"}
    end
  end



  get '/experiences/:id' do
    @experience = Experience.find(params[:id])
    erb :'experiences/show_experience'
  end



end
