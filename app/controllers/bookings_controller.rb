# Controlador que maneja la logica de reservas del sistema
class BookingsController < ApplicationController
  def create
    @booking = Booking.find_or_initialize_by(
      service_id: params[:service_id],
      user: current_user,
      payed: false
    )
    @booking.price = @booking.service.price
    @booking.save
    redirect_to todos_path, notice: 'Listoco'
  end

  def cart
    @bookings = current_user.bookings.where(payed: false)
  end
end
