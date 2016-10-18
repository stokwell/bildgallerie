class CreatePhotos < ActiveRecord::Migration
  def change 
     create_table :photos do |t|
      t.string :image_uid
      t.string :title
      t.string :author
      t.string :text
      t.timestamps null: false
    end 
  end
end
