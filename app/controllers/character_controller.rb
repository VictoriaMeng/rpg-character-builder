class CharacterController < ApplicationController
  get "/characters/new" do
    if logged_in?
      erb :'/characters/new'
    else
      redirect "/login"
    end
  end

  post "/characters/new" do
    if blank_values?(params[:character]) || blank_game_input?(params)
      redirect "/characters/new"
    else
      binding.pry
      @character = Character.create(params[:character])
      binding.pry
    end
  end
end
