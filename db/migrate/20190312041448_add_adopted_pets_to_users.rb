class AddAdoptedPetsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :adopted_pets, :string
  end
end
