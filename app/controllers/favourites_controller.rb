# Logica de los objetos marcados como favoritos
class FavouritesController < ApplicationController
  def create
    Favourite.create(
      status: true,
      user: current_user,
      service_id: params[:service_id]
    )
    redirect_to todos_path
  end

  def remove
    service = params[:id]
    @favourite = Favourite.where(user_id: current_user, service_id: service).take
    @favourite.destroy
    redirect_to todos_path, notice: 'Desmarcado!'
  end
end
