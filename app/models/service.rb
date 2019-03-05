class Service < ApplicationRecord
  belongs_to :region
  belongs_to :purveyor
  belongs_to :category
end
