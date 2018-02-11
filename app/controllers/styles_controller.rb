class StylesController < ApplicationController

  get '/styles' do
    erb :'styles/styles'
  end

  get '/styles/:id' do
    erb :'styles/show_style'
  end

end
