class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
