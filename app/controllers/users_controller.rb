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

    post '/login' do
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        binding.pry
        redirect "/users/#{@user.slug}"
      else
        redirect '/login'
      end
    end


end
