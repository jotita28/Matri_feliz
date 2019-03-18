# Clase perteneciente a los novios del sistema
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_one_attached :image
  has_many :user_todos, dependent: :destroy
  has_many :todos, through: :user_todos
  has_many :favourites, dependent: :destroy
  has_many :services, through: :favourites
  has_many :bookings, dependent: :destroy
  has_many :services, through: :bookings
  has_many :info_weddings, dependent: :destroy
  has_many :billings, dependent: :destroy
  # validates :phone,:presence => true,
  #                :numericality => true,
  #                :length => { :minimum => 10, :maximum => 15 }

  enum role: %i[guest user purveyor admin]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
    user.name = auth.info.name
    end
  end
end
