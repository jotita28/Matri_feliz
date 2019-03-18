class PurveyorsController < ApplicationController
  before_action :authenticate_user!
  def show
    @purveyor = Purveyor.find(params[:id])
    @service = Service.find(params[:service_id])
  end  
end
