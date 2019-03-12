# Logica del sistema de servicios perteneciente a los proveedores
class ServicesController < ApplicationController
  before_action :authenticate_user!, except: :new
  before_action :authenticate_purveyor!, only: :new
  def index
    todo = params[:todo_id]
    region = params[:region_id]
    @services = Service.where('todo_id = ?', todo).where('region_id = ?', region)
  end

  def new
    @service = Service.new
    @todos_for_select = Todo.pluck(:name, :id)
    @regions_for_select = Region.pluck(:name, :id)
  end

  def create
    @service = Service.new(services_params)
    @service.purveyor = current_purveyor
    @service.region_id = params[:service][:region]
    @service.todo_id = params[:service][:todo_id]
    @service.save
    redirect_to service_path(@service)
  end

  def show
    @service = Service.find(params[:id])
  end

  def search
    search = params[:search].capitalize
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
    params.require(:service).permit(:name, :detail, :price, :photo, :address)
  end
end
