class CreateProtectedStructures < ActiveRecord::Migration
  def self.up
    create_table :protected_structures do |t|
      t.integer :rps_number
      t.string :structure_name
      t.text :description
      t.string :street_number
      t.string :street_address
      t.string :townland
      t.integer :niah_ref
      t.string :rmp_ref
      t.float :longitude
      t.float :latitude
      t.timestamps
    end
  end

  def self.down
    drop_table :protected_structures
  end
end
