class RemoveIconFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :icon, :string
  end
end
