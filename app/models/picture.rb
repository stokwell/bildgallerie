class Picture < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title

  belongs_to :gallery
  dragonfly_accessor :image

   def next
    gallery.pictures.where("id > ?", id).order("id ASC").first
   end

   def prev
     gallery.pictures.where("id < ?", id).order("id DESC").first
   end
end
