class Food < ApplicationRecord
  has_many :recipe_foods, foreign_key: :food_id, class_name: 'RecipeFood'
  has_many :recipes, through: :recipe_foods, foreign_key: :food_id, class_name: 'Recipe'
  has_many :inventory_foods, foreign_key: :food_id, class_name: 'InventoryFood'

  validates :name, presence: true
  validates :measurement_unit, numericality: { only_float: true, greater_than: 0 }
  validates :price, numericality: { only_float: true, greater_than: 0 }
end
