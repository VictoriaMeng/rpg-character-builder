require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash
    set :session_secret, "something"
  end


  get "/" do
    erb :index
  end

  helpers do
    def blank_values?(params)
      params.values.any?(&:empty?)
    end

    def logged_in?
      session.has_key?(:id)
    end

    def new_game?
      !params[:new_game].empty?
    end
  end
end
