class UsersController < ApplicationController

    get '/signup' do
      if logged_in?
        redirect "/experiences"
      else
        erb :'users/signup'
      end
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
      if logged_in?
        redirect "/users/#{current_user.slug}"
      else
        flash[:message] = "Please note, you must sign up first if you don't already have an account."
        erb :'users/login'
      end
    end

    post '/login' do
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect "/users/#{@user.slug}"
      else
        redirect '/login'
      end
    end

    get '/logout' do
      session.clear
      redirect '/login'
    end

    get '/users/:slug' do
      @user = User.find_by_slug(params[:slug])
      erb :"users/show_user"
    end


end
