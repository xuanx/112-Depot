class AddUidToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :uid, :integer
  end

  def self.down
    remove_column :orders, :uid
  end
end
