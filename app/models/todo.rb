# Clase encargada de las tareas que deben realizar los novios para su matrimonio 
class Todo < ApplicationRecord
  has_many :user_todos, dependent: :destroy
  has_many :users, through: :user_todos
  has_many :services, dependent: :destroy
end
