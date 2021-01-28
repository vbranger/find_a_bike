class ChangeStationIdLimit < ActiveRecord::Migration[6.0]
  def change
    change_column :stations, :station_id, :integer, limit: 8
  end
end
