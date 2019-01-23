class RemoveOwnerIdFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :owner_id, :integer
  end
end
