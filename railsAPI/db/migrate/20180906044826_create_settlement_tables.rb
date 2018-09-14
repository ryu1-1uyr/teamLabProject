class CreateSettlementTables < ActiveRecord::Migration[5.2]
  def change
    create_table :settlement_tables do |t|
      t.integer :order_id
      t.string :namsettlement_state
      t.string :payment_method

      t.timestamps
    end
  end
end
