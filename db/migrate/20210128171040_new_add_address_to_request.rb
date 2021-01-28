class NewAddAddressToRequest < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :address, :string
  end
end
