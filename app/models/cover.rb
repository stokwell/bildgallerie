class Cover < ActiveRecord::Base
  belongs_to :gallery
  dragonfly_accessor :image
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
end
