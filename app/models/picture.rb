class Picture < ActiveRecord::Base
  belongs_to :gallery
  accepts_nested_attributes_for :gallery
  dragonfly_accessor :image
end
