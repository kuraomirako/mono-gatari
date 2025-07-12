class RemoveDraftFromStories < ActiveRecord::Migration[7.1]
  def change
    remove_column :stories, :draft, :boolean
  end
end
