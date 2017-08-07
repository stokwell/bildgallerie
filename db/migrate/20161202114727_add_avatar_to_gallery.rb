class AddAvatarToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :avatar, :string
  end
end
