class CharacterController < ApplicationController
  get "/characters/new" do
    erb :'/characters/new'
  end
end
