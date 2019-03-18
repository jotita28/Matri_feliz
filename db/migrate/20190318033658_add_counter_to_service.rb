class AddCounterToService < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :counter, :integer, default: 1
  end
end
