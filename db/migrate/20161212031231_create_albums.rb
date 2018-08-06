class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.references :albumable, polymorphic: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
