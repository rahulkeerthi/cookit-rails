class AddNameToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :name, :string
  end
end
