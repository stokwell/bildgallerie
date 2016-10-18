class User < ActiveRecord::Base
  has_secure_password 
  has_many :users_images
end
