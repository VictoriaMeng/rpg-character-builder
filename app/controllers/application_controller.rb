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

    def blank_game_input?(params)
      params[:game_id].empty? && params[:new_game].empty?
    end

    def logged_in?
      session.has_key?(:id)
    end
  end
end
