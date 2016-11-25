class Cover < ActiveRecord::Base
  belongs_to :gallery
  dragonfly_accessor :image
end
