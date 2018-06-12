class UserController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    binding.pry
    if blank_values?(params)
      redirect "/signup"
    else
      @user = User.create(params)
    end
    binding.pry
  end



end
