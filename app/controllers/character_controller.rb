class CharacterController < ApplicationController
  get "/characters/new" do
    erb :'/characters/new'
  end

  post "/characters/new" do
    if blank_values?(params[:character]) || blank_game_input?(params)
      redirect "/characters/new"
    else
      binding.pry
    end
  end
end
