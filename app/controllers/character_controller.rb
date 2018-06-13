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
      @character = Character.create(params[:character])
      @user = User.find(session[:id])
      @character.user_id = @user.id
      if !params[:game_id].empty?
        @game = Game.find(params[:game_id])
      else
        @game = Game.create(name: params[:new_game])
      end
      @character.game_id = @game.id
      @character.save
      @user.save
      @game.save
      redirect "/users/#{@user.id}"
    end
  end
end
