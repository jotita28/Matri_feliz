# Controlador que maneja la logica de reservas del sistema
class BookingsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource

  def create
    @service = Service.find(params[:service_id])
    @booking = Booking.find_or_initialize_by(
      service: @service,
      user: current_user,
      purveyor_id: @service.purveyor_id,
      payed: false
      )
    @booking.price = @service.price
    @booking.save
    redirect_to todos_path, notice: 'Listoco'
  end

  def cart
    @bookings = current_user.bookings.where(payed: false)
  end
end
