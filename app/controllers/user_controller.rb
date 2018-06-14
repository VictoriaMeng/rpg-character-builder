class UserController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "/users/#{session[:id]}"
    else
      erb :'users/signup'
    end
  end

  get '/users/:id' do
    if correct_user?
      @user = User.find(session[:id])
      erb :'users/show'
    else
      redirect "/login"
    end
  end

  get '/login' do
    if logged_in?
      redirect "/users/#{session[:id]}"
    else
      erb :'users/login'
    end
  end

  post '/signup' do
    if blank_values? || user_exists?
      redirect "/signup"
    else
      @user = User.create(params)
      session[:id] = @user.id
      redirect "/users/#{@user.id}"
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect "/login"
    end
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

end
