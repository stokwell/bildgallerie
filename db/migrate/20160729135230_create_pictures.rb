class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image_uid
      t.string :title
      t.string :author
      t.string :description
      t.references :gallery, foreign_key: true
      t.timestamps null: false
    end
  end
end
