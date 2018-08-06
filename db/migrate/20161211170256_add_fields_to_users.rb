class AddFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    #добавить колонку в :таблицу, :название_колонки, :тип_данных_колонки 
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :age, :integer
    add_column :users, :male, :boolean
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :description, :text
  end
end
