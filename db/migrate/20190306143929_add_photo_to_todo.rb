class AddPhotoToTodo < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :photo, :string
  end
end
