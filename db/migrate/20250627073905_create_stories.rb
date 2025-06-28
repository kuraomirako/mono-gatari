class CreateStories < ActiveRecord::Migration[7.1]
  def change
    create_table :stories do |t|
      t.string     :title,    null: false
      t.text       :body,     null: false
      t.integer    :category_id, null: false
      t.integer    :genre_id,    null: false
      t.boolean    :draft, null: false, default: false
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
