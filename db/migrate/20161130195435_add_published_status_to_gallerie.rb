class AddPublishedStatusToGallerie < ActiveRecord::Migration
  def change
    add_column :galleries, :published, :boolean, default: false
  end
end
