class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.references :user
      t.references :project
      t.date :date
      t.float :hours

      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
