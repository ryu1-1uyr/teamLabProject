class AddColumnGender < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :gender, :string
  end
end
