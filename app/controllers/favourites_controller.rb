class FavouritesController < ApplicationController

  def create
  Favourite.create(
    status: true,
    user: current_user,
    service_id: params[:service_id]
  )
  redirect_to root_path
  end

  def destroy 
    
  end
  
end
