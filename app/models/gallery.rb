class Gallery < ActiveRecord::Base
  has_one :cover, :dependent =>:destroy
  has_many :pictures, :dependent =>:destroy
  accepts_nested_attributes_for :pictures, :allow_destroy => true
  validates :name, :description, :presence => true
  dragonfly_accessor :image
end
