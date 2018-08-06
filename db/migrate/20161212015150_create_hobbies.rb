class CreateHobbies < ActiveRecord::Migration[5.0]
  def change
    create_table :hobbies do |t|
      t.references :user, foreign_key: true
      t.string :value
      t.text :description

      t.timestamps
    end
    add_index :hobbies, :value, unique: true
  end
end
