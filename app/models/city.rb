class City < ApplicationRecord
  has_many :city_resources
  has_many :resources, through: :city_resources
end
