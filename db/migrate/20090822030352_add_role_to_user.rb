class AddRoleToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :role, :integer
  end

  def self.down
  end
end
