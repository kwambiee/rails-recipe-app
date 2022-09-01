class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true, allow_blank: false


  belongs_to :user, class_name: 'User'
  has_many :recipe_foods, foreign_key: :recipe_id, class_name: 'RecipeFood', dependent: :destroy
  has_many :foods, through: :recipe_foods, foreign_key: :recipe_id, class_name: 'Food', dependent: :destroy
  has_many :inventories, through: :user, foreign_key: :recipe_id, class_name: 'Inventory', dependent: :destroy
  has_many :shopping_lists
end
