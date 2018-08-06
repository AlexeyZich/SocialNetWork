class AddHobbiesAndUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :hobbies_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :hobby, index: true
    end
  end
end
