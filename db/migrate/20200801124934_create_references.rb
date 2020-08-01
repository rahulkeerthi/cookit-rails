class CreateReferences < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurant_tags do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end

    create_table :kit_tags do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
    end

    create_table :user_restaurants do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end

  end
end
