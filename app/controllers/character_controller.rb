class CharacterController < ApplicationController
  get "/characters/new" do
    if logged_in?
      erb :'/characters/new'
    else
      flash[:error] = "Error: You must login to create a character."
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
       flash[:error] = "Error: You must login to view your characters. You may only view characters that you created."
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
       flash[:error] = "Error: You must login to edit your characters. You may only edit characters that you created."
       redirect "/login"
     end
  end

  post "/characters/new" do
    if incomplete_form?
      flash[:error] = "Error: Please fill in all fields."
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
    if no_edits?
      flash[:error] = "Error: Please make at least one edit."
      redirect "/characters/#{params[:id]}/edit"
    elsif !belongs_to_user?
      flash[:error] = "Error: You must login to edit your characters. You may only edit characters that you created."
      redirect "/login"
    else
      @character = Character.find(params[:id])
      params[:character].each do |key, value|
        @character.update("#{key}": "#{value}") unless value.empty?
      end
      if params[:game_id]
        @character.update(game_id: params[:game_id])
      elsif new_game?
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
      flash[:message] = "Error: You must be logged on to delete characters. You may only delete characters you created."
      redirect "/login"
    end
  end

end
