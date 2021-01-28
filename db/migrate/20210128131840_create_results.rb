class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.references :request, null: false, foreign_key: true
      t.references :station, null: false, foreign_key: true
      t.integer :num_bikes

      t.timestamps
    end
  end
end
