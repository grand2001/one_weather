class AddTitleToItems2 < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :customer_id, :integer
  end
end
