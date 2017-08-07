class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.string :image_uid
      t.references :gallery, foreign_key: true
      t.timestamps null: false
    end
  end
end
