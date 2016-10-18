class CreateUsersImages < ActiveRecord::Migration
  def change
    create_table :users_images do |t|
      t.string :title
      t.string :author
      t.string :description
      t.string :image_uid
      t.references :user
      t.timestamps null: false
    end
  end
end
