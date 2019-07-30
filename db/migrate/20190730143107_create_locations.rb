class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.integer :vehicle_id
      t.datetime :at
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
