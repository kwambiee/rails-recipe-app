class RecipeFood < ApplicationRecord
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :food_id, presence: true
  validates :recipe_id, presence: true


  belongs_to :recipe, class_name: 'Recipe'
  belongs_to :food, class_name: 'Food'
end
