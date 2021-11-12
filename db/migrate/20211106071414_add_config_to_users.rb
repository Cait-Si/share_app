class AddConfigToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :introduction, :string
    add_column :users, :icon, :string
  end
end
