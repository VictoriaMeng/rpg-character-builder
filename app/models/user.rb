class User < ActiveRecord::Base
  has_secure_password
  has_many :characters
  has_many :user_games
  has_may :games, through: :user_games
end
