# Clase perteneciente a los novios del sistema
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image
  has_many :user_todos
  has_many :todos, through: :user_todos
  has_many :favourites
  has_many :services, through: :favourites
  has_many :bookings
  has_many :services, through: :bookings

  # validates :phone,:presence => true,
  #                :numericality => true,
  #                :length => { :minimum => 10, :maximum => 15 }

  enum role: %i[guest user purveyor admin]
end
