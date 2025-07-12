class AddStatusToStories < ActiveRecord::Migration[7.1]
  def change
    add_column :stories, :status, :integer, null: false, default: 0
  end
end
