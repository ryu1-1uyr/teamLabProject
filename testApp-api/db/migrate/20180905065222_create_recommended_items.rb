class CreateRecommendedItems < ActiveRecord::Migration[5.2]
  def change
    create_table :recommended_items do |t|
      t.string :puroduct_id

      t.timestamps
    end
  end
end
