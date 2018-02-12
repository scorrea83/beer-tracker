class ExperiencesController < ApplicationController

  get '/experiences' do
    erb :'experiences/experiences'
  end
end
