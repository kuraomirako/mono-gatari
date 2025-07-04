class AddStatusToStories < ActiveRecord::Migration[7.1]
  def change
    add_column :stories, :status, :string, default: "published", null: false
  end
end
