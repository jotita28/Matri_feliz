class CreateUserTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :user_todos do |t|
      t.boolean :status
      t.references :user, foreign_key: true
      t.references :todo, foreign_key: true

      t.timestamps
    end
  end
end
