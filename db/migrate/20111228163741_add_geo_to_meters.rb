class AddGeoToMeters < ActiveRecord::Migration
  def self.up
    add_column :meters, :location, :string
    add_column :meters, :tarriff, :float
    add_column :meters, :latitude, :float
    add_column :meters, :longitude, :float
  end

  def self.down
    remove_column :meters, :location
    remove_column :meters, :tarriff
    remove_column :meters, :latitude
    remove_column :meters, :longitude
  end
end
