class AddAdoptedAndOwnerIdToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :adopted, :boolean, default: false
    add_column :pets, :owner_id, :integer, index: true
  end
end
