class CreateKits < ActiveRecord::Migration[6.0]
  def change
    create_table :kits do |t|
      t.string :name
      t.text :description
      t.string :ingredients
      t.string :link_url
      t.float :price
      t.integer :counter, null: false, default: 0
      t.integer :serves_count, null: false, default: 0
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
