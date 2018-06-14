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
     if belongs_to_user?
       @game = Game.find(@character.game_id)
       @user = User.find(@character.user_id)
       erb :"/characters/show"
     else
       redirect "/login"
     end
  end

  get "/characters/:id/edit" do
    @character = Character.find(params[:id])
     if belongs_to_user?
       @game = Game.find(@character.game_id)
       @user = User.find(@character.user_id)
       erb :"/characters/edit"
     else
       redirect "/login"
     end
  end

  post "/characters/new" do
    if incomplete_form?
      redirect "/characters/new"
    else
      @character = Character.create(params[:character])
      @user = User.find(session[:id])
      @character.update(user_id: @user.id)
      if params[:game_id]
        @game = Game.find(params[:game_id])
      else
        @game = Game.create(name: params[:new_game])
      end
      @character.update(game_id: @game.id)
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
      if params[:character][:game_id]
        @character.update(game_id: params[:character][:game_id])
      elsif !params[:new_game].empty?
        @game = Game.create(name: params[:new_game])
        @character.update(game_id: @game.id)
      end
      redirect "/characters/#{@character.id}"
    end
  end

  delete "/characters/:id/delete" do
    @character = Character.find(params[:id])
    if belongs_to_user?
      @character.destroy
      redirect "/users/#{@character.user_id}"
    else
      redirect "/login"
    end
  end

end
