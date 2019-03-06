# Clase encargada de guardar los servicios como favoritos
class Favourite < ApplicationRecord
  belongs_to :service
  belongs_to :user
end
