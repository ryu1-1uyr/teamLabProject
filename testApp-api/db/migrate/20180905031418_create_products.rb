class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :category_id
      t.string :size
      t.string :gender
      t.text :description
      t.text :image_url

      t.timestamps
    end
  end
end
