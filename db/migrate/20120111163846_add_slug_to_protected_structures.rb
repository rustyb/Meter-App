class AddSlugToProtectedStructures < ActiveRecord::Migration
  def change
    add_column :protected_structures, :slug, :string
    add_index :protected_structures, :slug
  end
end
