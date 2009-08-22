class AddStatusToEntries < ActiveRecord::Migration
  def self.up
    add_column :entries, :status, :int
  end

  def self.down
  end
end
