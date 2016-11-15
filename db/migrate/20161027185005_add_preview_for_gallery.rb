class AddPreviewForGallery < ActiveRecord::Migration
  def change
  	add_column :galleries, :image_uid, :string
  end
end
