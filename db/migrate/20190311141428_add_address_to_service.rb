class AddAddressToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :address, :string
  end
end
