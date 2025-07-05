class RemoveStatusFromStories < ActiveRecord::Migration[7.1]
  def change
    remove_column :stories, :status, :string
  end
end
