class ChangeKitTagsTable < ActiveRecord::Migration[6.0]
  def change
    remove_reference :kit_tags, :restaurant, index: true, foreign_key: true
    add_reference :kit_tags, :kit, foreign_key: true
  end
end
