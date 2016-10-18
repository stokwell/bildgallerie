class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :title
      t.string :author
      t.string :text

      t.timestamps null: false
    end
  end
end
