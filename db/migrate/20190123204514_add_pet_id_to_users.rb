class AddPetIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pet_id, :integer
  end
end
