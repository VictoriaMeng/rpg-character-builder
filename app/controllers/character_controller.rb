class CharacterController < ApplicationController
  get "/characters/new" do
    if logged_in?
      erb :'/characters/new'
    else
      redirect "/login"
    end
  end

  get "/characters/:id" do
    @character = Character.find(params[:id])
     if belongs_to_user?(@character)
       @game = Game.find(@character.game_id)
       @user = User.find(@character.user_id)
       erb :"/characters/show"
     else
       redirect "/login"
     end
  end

  get "/characters/:id/edit" do
    @character = Character.find(params[:id])
     if belongs_to_user?(@character)
       @game = Game.find(@character.game_id)
       @user = User.find(@character.user_id)
       erb :"/characters/edit"
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
      if params[:game_id]
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

  patch "/characters/:id/edit" do
    if all_empty?(params[:character]) && params[:new_game].empty?
      redirect "/characters/#{params[:id]}/edit"
    else
      @character = Character.find(params[:id])
      params[:character].each do |key, value|
        @character.update("#{key}": "#{value}") unless value.empty?
      end
      binding.pry
      if params[:character][:game_id]
        @character.update(game_id: params[:character][:game_id])
        binding.pry
      end
    end
  end

end
