# Logica del sistema de servicios perteneciente a los proveedores
class ServicesController < ApplicationController
  def index
    todo = params[:todo_id]
    region = params[:region_id]
    @services = Service.where('todo_id = ?', todo).where('region_id = ?', region)
  end

  def new
    @service = Service.new
    @todos_for_select = Todo.pluck(:name, :id)
  end

  def create
    @service = Service.new(services_params)
    @service.save
    redirect_to root_path
  end

  def show
    @service = Service.find(params[:id])
  end

  def search
    search = params[:search]
    @service = Service.where("name like ?", "%#{search}%").last

    # @service = Service.find_by(name: search)

    if @service.nil? 
      redirect_to todos_path, alert: 'No se han encontrado resultados'
    else
      redirect_to service_path(@service), notice: 'Encontrado!'
    end
  end

  private

  def services_params
    params.require(:service).permit(:name, :detail, :price, :photo)
  end
end
