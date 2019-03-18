class AddPhoto2ToTodo < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :photo2, :string
  end
end
