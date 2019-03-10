# Clase encargada de todo lo referente a las distintas categorias de servicios
class Category < ApplicationRecord
  has_many :services
end
