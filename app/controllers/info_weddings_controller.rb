class InfoWeddingsController < ApplicationController
  before_action :set_infowedding, only: %i[show edit update]
  authorize_resource
  def index
    @info_wedding = InfoWedding.where('user_id = ?', current_user).last
  end

  def new 
    @info_wedding = InfoWedding.new
    respond_to do |format|
      format.js
    end
  end

  def create 
    @info_wedding = InfoWedding.new(info_wedding_params)
    @info_wedding.user = current_user
    respond_to do |format|
      if @info_wedding.save
        format.js
      else
        format.html {redirect_to root_path, alert: 'Por favor intente nuevamente'} 
      end
    end
  end

  def show; end

  def edit
    respond_to do |format|
      format.js
    end
  end

  def update
    respond_to do |format|
      if @info_wedding.update(info_wedding_params)
        format.js
      else
        format.html {redirect_to root_path, alert: 'Por favor intente nuevamente'} 
      end
    end
  end

  private

  def info_wedding_params
    params.require(:info_wedding).permit(:description, :civil_date, :note1, :note2, :religious_date, :church_address, :location_address)
  end

  def set_infowedding
    @info_wedding = InfoWedding.find(params[:id])
  end
end