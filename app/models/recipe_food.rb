class RecipeFood < ApplicationRecord
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  belongs_to :recipe, class_name: 'Recipe', optional: true
  belongs_to :food, class_name: 'Food', optional: true
end
