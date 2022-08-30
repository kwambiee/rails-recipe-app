class Food < ApplicationRecord
  has_many :recipe_foods, foreign_key: :food_id, class_name: 'RecipeFood'
  has_many :recipes, through: :recipe_foods, foreign_key: :food_id, class_name: 'Recipe'
end
