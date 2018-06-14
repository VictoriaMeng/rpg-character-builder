class User < ActiveRecord::Base
  has_secure_password
  has_many :characters
  has_many :games, through: :characters
end
