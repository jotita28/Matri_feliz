# Clase para controlar las transacciones realizadas en el sitio
class Billing < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
end
