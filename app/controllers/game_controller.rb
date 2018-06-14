class GameController < ApplicationController
  get '/games/:id' do
    @game = Game.find(params[:id])
    erb :'games/show'
  end
end
