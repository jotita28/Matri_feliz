# Clase encargada de los Servicios de los proveedores 
class Service < ApplicationRecord
  belongs_to :region
  belongs_to :purveyor
  belongs_to :category
  has_many :favourites 
  has_many :users, through: :favourites

  has_many :bookings 
  has_many :users, through: :bookings
end
