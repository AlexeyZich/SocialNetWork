class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.text :body
      t.references :postable, polymorphic: true
      t.integer :repost_id

      t.timestamps
    end
    add_index :posts, :repost_id

    add_foreign_key :posts, :posts, column: :repost_id
  end
end
