class AddColumnHtmlUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :html_url , :string
  end

end
