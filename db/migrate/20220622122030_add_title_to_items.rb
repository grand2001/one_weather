class AddTitleToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :genre_id, :integer
    add_column :items, :introduction, :text
  end
end
