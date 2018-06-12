class UserController < ApplicationController

  get '/signup' do
    erb :'users/signup'
  end

end
