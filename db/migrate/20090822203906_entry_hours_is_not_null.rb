class EntryHoursIsNotNull < ActiveRecord::Migration
  def self.up
    change_column :entries, :hours, :float, :default => 0, :null => false
  end

  def self.down
  end
end
