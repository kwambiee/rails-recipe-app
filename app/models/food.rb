class Food < ApplicationRecord
  has_many :inventory_foods
  has_many :users, through: :inventory_foods
end
