class CreateFriendRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :friend_requests do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :approved

      t.timestamps
    end
    add_index :friend_requests, :sender_id
    add_index :friend_requests, :recipient_id

    add_foreign_key :friend_requests, :users, column: :sender_id
    add_foreign_key :friend_requests, :users, column: :recipient_id

    add_index :friend_requests, [:sender_id, :recipient_id], unique: true
  end
end
