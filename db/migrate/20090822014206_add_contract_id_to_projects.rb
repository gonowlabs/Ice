class AddContractIdToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :contract_id, :integer
  end

  def self.down
    remove_column :projects, :contract_id
  end
end
