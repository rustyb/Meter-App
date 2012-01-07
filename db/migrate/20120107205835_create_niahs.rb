class CreateNiahs < ActiveRecord::Migration
  def self.up
    create_table :niahs, :id => false do |t|
      t.integer :reg_number
      t.string :rating
      t.string :number
      t.string :name
      t.string :street1
      t.string :street2
      t.string :town
      t.string :county
      t.string :townland
      t.string :building_type
      t.string :year_from
      t.string :year_to
      t.text :composition
      t.text :appraisal
      t.string :web_link
      t.string :image_link
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
  def self.down
    drop_table :niahs
  end
end
