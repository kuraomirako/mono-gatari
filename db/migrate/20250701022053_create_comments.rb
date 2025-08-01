class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text       :comment_box,    null: false
      t.references :user,     null: false, foreign_key: true
      t.references :story,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
