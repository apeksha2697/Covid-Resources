class Resource < ApplicationRecord
  has_many :city_resources
  has_many :cities, through: :city_resources
end
