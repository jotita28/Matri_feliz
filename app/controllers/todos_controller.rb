# Controlador que maneja la logica de los ToDos
class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def show
    @todo = Todo.find(params[:id])
    @region_for_select = Region.pluck(:name, :id)
  end

  def completed
    todo = params[:todo_id]
    @com = UserTodo.create(
      status: true, 
      user: current_user,
      todo_id: todo
    )
    redirect_to todos_path, notice: 'Completada'
  end
end
