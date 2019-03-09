# Clase encargada de las tareas que deben realizar los novios para su matrimonio 
class Todo < ApplicationRecord
  has_many :user_todos
  has_many :users, through: :user_todos
  has_many :services
end
