class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :age
      t.string :sex
      t.string :size
      t.string :breed
      t.string :animal
      t.string :description

      t.timestamps
    end
  end
end
