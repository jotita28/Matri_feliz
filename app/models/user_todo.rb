# Clase encargada de registrar las tareas por usuarios
class UserTodo < ApplicationRecord
  belongs_to :user
  belongs_to :todo
end
