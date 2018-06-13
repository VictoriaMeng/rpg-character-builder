class UserController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  get '/users/:id' do
    erb :'users/show'
  end

  get '/login' do
    erb :'users/login'
  end

  post '/signup' do
    if blank_values?(params)
      redirect "/signup"
    else
      @user = User.create(params)
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    end
  end

  post '/login' do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      redirect "/login"
    end
  end



end
