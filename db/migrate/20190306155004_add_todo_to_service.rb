class AddTodoToService < ActiveRecord::Migration[5.2]
  def change
    add_reference :services, :todo, foreign_key: true
  end
end
