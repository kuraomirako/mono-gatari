class AddProfileToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :profile, :text
    add_column :users, :icon, :string
  end
end
