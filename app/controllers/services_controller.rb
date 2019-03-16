# Logica del sistema de servicios perteneciente a los proveedores
class ServicesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :authenticate_purveyor!, only: [:new, :create, :details]
  def index
    @todo = params[:todo_id]
    @region = params[:region_id]
    @services = Service.where('todo_id = ?', @todo).where('region_id = ?', @region)

    respond_to do |format|
      if !params[:buscador].nil?
        if params[:buscador].blank?
          @services = Service.where('todo_id = ?', @todo).where('region_id = ?', @region)
        else
          @services = Service.where('name LIKE ?', "%#{params[:buscador]}%")
        end
        format.js
      else
        @services = Service.where('todo_id = ?', @todo).where('region_id = ?', @region)
        format.html
      end
    end
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
    if @service.nil? 
      redirect_to todos_path, alert: 'No se han encontrado resultados'
    else
      redirect_to service_path(@service), notice: 'Encontrado!'
    end
  end

  def my_services
    @services = current_purveyor.services
  end
  
  def my_sales
    @sales = Booking.where(payed:true, purveyor_id: current_purveyor)
  end
  

  def edit
    @service = Service.find(params[:id])
    @todos_for_select = Todo.pluck(:name, :id)
    @regions_for_select = Region.pluck(:name, :id)
  end
  
  def update
    @service = Service.find(params[:id])
    respond_to do |format|
      if @service.update(services_params)
        format.html { redirect_to service_path(@service), alert: 'Servicio actualizado'} 
      else
        format.html { redirect_to root_path, alert: 'Por favor intente nuevamente'} 
      end
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    respond_to do |format|
      format.html { redirect_to myservices_services_path, notice: 'Servicio Eliminado'}
      format.json { head :no_content }
    end
  end
  

  private

  def services_params
    params.require(:service).permit(:name, :detail, :price, :photo, :address, images:[])
  end
end
