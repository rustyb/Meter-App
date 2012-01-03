class CreateMeters < ActiveRecord::Migration
  def self.up
    create_table :meters do |t|
      t.string :name
      t.string :info
      t.timestamps
    end
  end

  def self.down
    drop_table :meters
  end
end
