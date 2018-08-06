class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :likeable, polymorphic: true
      t.references :user, foreign_key: true

      t.timestamps
    end

    add_index :likes, [:likeable_id, :likeable_type], unique: true
  end
end
