# Clase encargada de la Region a la cual pertence un proveedor
class Region < ApplicationRecord
  has_many :services
end
