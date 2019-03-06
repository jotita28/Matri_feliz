# Clase encargada de guardar las reservas (pagadas o no pagadas) de servicio
class Booking < ApplicationRecord
  belongs_to :service
  belongs_to :user
  belongs_to :billing
end
