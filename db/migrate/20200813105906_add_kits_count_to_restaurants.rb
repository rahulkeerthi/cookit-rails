class AddKitsCountToRestaurants < ActiveRecord::Migration[6.0]
  def change
    add_column :restaurants, :kits_count, :integer
  end
end
