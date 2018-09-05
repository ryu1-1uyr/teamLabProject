class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :product_id
      t.integer :how_many_buy
      t.string :address
      t.string :user_name

      t.timestamps
    end
  end
end
