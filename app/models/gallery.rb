class Gallery < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  validates :name, :description,  :presence => true

  has_one :cover, :dependent =>:destroy
  has_many :pictures, :dependent =>:destroy
  belongs_to :user

  mount_uploader :avatar, AvatarUploader
  

  dragonfly_accessor :image

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  after_update :crop_avatar

  def crop_avatar
    if crop_x.present?
        self.avatar.model.crop_x.present?
        avatar.recreate_versions!
      end
  end

end
