class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :finish_date

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
