class CreateStations < ActiveRecord::Migration[6.0]
  def change
    create_table :stations do |t|
      t.integer :station_id
      t.string :name
      t.float :lat
      t.float :lon
      t.integer :capacity
      t.string :stationCode

      t.timestamps
    end
  end
end
