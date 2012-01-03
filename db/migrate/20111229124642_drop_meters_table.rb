class DropMetersTable < ActiveRecord::Migration
  def up
    drop_table :meters
    create_table :meters do |t|
      t.integer :dublin_no
      t.string :location
      t.integer :code
      t.string :spaces
      t.string :exact_location
      t.date :installed
      t.float :tariff
      t.string :nearest_pad
      t.string :op_hours
      t.boolean :clearway
      t.string :clearway_hours
      t.string :comment
      t.string :further_info
      t.boolean :finished
      t.string :extra_comment
      t.string :zone
      t.float :longitude
      t.float :latitude
      t.timestamps
    end
  end

  def down
    drop_table :meters
    
    create_table :meters do |t|
      t.string :name
      t.string :info
      t.timestamps
    end
  end
end
