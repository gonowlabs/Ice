class CreateContracts < ActiveRecord::Migration
  def self.up
    create_table :contracts do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :finish_date

      t.timestamps
    end
  end

  def self.down
    drop_table :contracts
  end
end
