class Recipe < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, foreign_key: :recipe_id, class_name: 'RecipeFood', dependent: :destroy
  has_many :foods, through: :recipe_foods, foreign_key: :recipe_id, class_name: 'Food', dependent: :destroy
end
