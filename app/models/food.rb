class Food < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { only_float: true, greater_than: 0 }

  has_many :recipe_foods, foreign_key: :food_id, class_name: 'RecipeFood', dependent: :destroy
  has_many :recipes, through: :recipe_foods, foreign_key: :food_id, class_name: 'Recipe', dependent: :destroy
  has_many :inventory_foods, foreign_key: :food_id, class_name: 'InventoryFood', dependent: :destroy
  has_many :inventories, through: :inventory_foods, foreign_key: :food_id, class_name: 'Inventory', dependent: :destroy
end
