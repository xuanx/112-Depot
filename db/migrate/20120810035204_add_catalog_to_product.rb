class AddCatalogToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :catalog, :string
  end

  def self.down
    remove_column :products, :catalog
  end
end
