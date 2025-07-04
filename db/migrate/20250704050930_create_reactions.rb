class CreateReactions < ActiveRecord::Migration[7.1]
  def change
    create_table :reactions do |t|
      t.references :user,     null: false, foreign_key: true
      t.references :story,     null: false, foreign_key: true
      t.string     :kind,     null: false
      t.timestamps
    end
     add_index :reactions, [:user_id, :story_id, :kind], unique: true
  end
end
