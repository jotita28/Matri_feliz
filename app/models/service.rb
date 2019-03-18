# Clase encargada de los Servicios de los proveedores
class Service < ApplicationRecord
  belongs_to :region
  belongs_to :purveyor
  belongs_to :category, optional: true
  belongs_to :todo
  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites

  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings

  has_many_attached :images

  validates :photo, presence: true
end
