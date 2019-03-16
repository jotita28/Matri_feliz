# Controlador que maneja la logica de los ToDos
class TodosController < ApplicationController
  before_action :authenticate_user!
  def index
    @todos = Todo.all
    @services = Service.all
    @info_wedding = InfoWedding.where('user_id = ?', current_user).last
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
