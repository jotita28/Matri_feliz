# Clase perteneciente a los proveedores de servicio
class Purveyor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :services, dependent: :destroy
  has_many :bookings, dependent: :destroy

  enum role: %i[guest user purveyor admin]
end
