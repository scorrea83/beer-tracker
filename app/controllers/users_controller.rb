class UsersController < ApplicationController

    get '/signup' do
      erb :'users/signup'
    end

    post '/signup' do
      @user = User.new(params)
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect "/users/#{@user.slug}"
      else
        @errors = @user.errors.full_messages
        redirect "/signup"
      end
    end

    get '/login' do
      erb :'users/login'
    end



end
