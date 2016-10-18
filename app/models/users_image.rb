class UsersImage < ActiveRecord::Base
  dragonfly_accessor :image
  belongs_to :user
end
