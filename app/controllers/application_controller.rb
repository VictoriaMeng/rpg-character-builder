require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "something"
  end


  get "/" do
    erb :index
  end

  helpers do
    def blank_values?(params)
      params.values.any?(&:empty?)
    end

    def genders
      %w(Female Male Nonbinary)
    end

    def blank_game_input?
      !params[:game_id] && params[:new_game].empty?
    end

    def incomplete_form?
      blank_values?(params[:character]) || blank_game_input?
    end

    def logged_in?
      session.has_key?(:id)
    end

    def correct_user?
      session[:id] == params[:id].to_i
    end

    def belongs_to_user?
      @character.user_id == session[:id]
    end

    def all_empty?(params)
      params.values.all?(&:empty?)
    end

    def user_exists?
      username_exists? || email_exists?
    end

    def username_exists?
      User.where("lower(username) = ?", params[:username].downcase).exists?
    end

    def email_exists?
      User.where("lower(email) = ?", params[:email].downcase).exists?
    end

    def no_edits?
      all_empty?(params[:character]) && blank_game_input?
    end

    def new_game?
      !params[:new_game].empty?
    end
  end
end
