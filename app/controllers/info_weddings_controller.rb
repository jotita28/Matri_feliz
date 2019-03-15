class InfoWeddingsController < ApplicationController
  def index; end
 
  def new 
    @info_wedding = InfoWedding.new 
    respond_to do |format|
      format.js 
    end
  end

  def create 
    @info_wedding = InfoWedding.new(
      name: params[:company][:name]
    )
    respond_to do |format|
      if @company.save
        format.js
      else
        format.html {redirect_to root_path, alert: 'Por favor intente nuevamente'} 
      end
    end
  end

end
