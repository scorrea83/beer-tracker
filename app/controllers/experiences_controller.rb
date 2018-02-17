require 'rack-flash'

class ExperiencesController < ApplicationController
  use Rack::Flash

  get '/experiences' do
    erb :'experiences/experiences'
  end

  get '/experiences/:id' do
    @experience = Experience.find(params[:id])
    erb :'experiences/show_experience'
  end



end
