class StylesController < ApplicationController

  get '/styles' do
    erb :'styles/styles'
  end

  get '/styles/:id' do
    @style = Style.find(params[:id])
    erb :'styles/show_style'
  end

end
