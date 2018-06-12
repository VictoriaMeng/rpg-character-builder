class UserController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    binding.pry
    @user = User.find_or_create_by(username: params[:username], password: params[:password])
    binding.pry
  end

end
