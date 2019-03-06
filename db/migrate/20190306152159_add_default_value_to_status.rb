class AddDefaultValueToStatus < ActiveRecord::Migration[5.2]
  def change
    change_column :user_todos, :status, :boolean, default: false
  end
end
