require 'rack-flash'

class ExperiencesController < ApplicationController
  use Rack::Flash

  get '/experiences' do
    if logged_in?
      erb :'experiences/experiences'
    else
      redirect '/login'
    end
  end

  get '/experiences/new' do
    if logged_in?
      erb :'experiences/create_experience'
    else
      redirect '/login'
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
    elsif !params[:style_name].empty? && !params[:beer][:style_id].empty?
      @errors = ["When creating new beer, please only select Beer Style from list OR fill out the new Style Name"]
      erb :'experiences/create_experience', locals: {message: "brewery located/created"}
    elsif new_beer.valid?
      @beer = new_beer
      @beer.save
      erb :'experiences/create_experience', locals: {message: "beer located/created"}
    elsif !params[:style_name].empty? && params[:beer][:name] != ""  && params[:beer][:abv] != ""
      if @new_style.valid?
        @new_style.save
        new_beer.style = @new_style
        @beer = new_beer
        @beer.save
        erb :'experiences/create_experience', locals: {message: "beer located/created"}
      else
        @errors = @new_style.errors.full_messages
        @errors.map! {|error| "New Beer Style #{error}"}
        erb :'experiences/create_experience', locals: {message: "brewery located/created"}
      end
    else
      flash[:message] = "Sorry, to continue you must either select a beer from the dropdown list OR add new beer information to create new beer."
      if !new_beer.valid?
        @errors = new_beer.errors.full_messages
        @errors.map! {|error| "New Beer #{error}"}
      end
      erb :'experiences/create_experience', locals: {message: "brewery located/created"}
    end
  end

  post '/experiences' do
    @user = current_user
    if params[:experience][:rating] != ""
      @user.experiences.build(params[:experience])
      @user.save
      redirect "/users/#{@user.slug}"
    else
      @beer = Beer.find_by(id: params[:experience][:beer_id])
      @brewery = @beer.brewery
      @errors = ["Rating cannot be left blank."]

      erb :'experiences/create_experience', locals: {message: "beer located/created"}
    end
  end

  get '/experiences/:id' do
    if logged_in?
      @experience = Experience.find(params[:id])
      erb :'experiences/show_experience'
    else
      redirect '/login'
  end

  get '/experiences/:id/edit' do
    @experience = Experience.find_by(id: params[:id])
    binding.pry
    if @experience && experience_ownership?(@experience)
      erb :'experiences/edit_experience'
    else
      redirect '/experiences'
    end
  end

  delete '/experiences/:id/delete' do
    @experience = Experience.find_by(id: params[:id])
    if experience_ownership?(@experience)
      current_user.experiences.destroy(@experience)
      flash[:message] = "Experience has been deleted."
      redirect "/users/#{current_user.slug}"
    else
      redirect "/experiences"
    end
  end


end
