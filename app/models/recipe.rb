class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true, allow_blank: false, length: { maximum: 500 }

  belongs_to :user, class_name: 'User', optional: true
  has_many :recipe_foods, foreign_key: :recipe_id, class_name: 'RecipeFood', dependent: :destroy
  has_many :foods, through: :recipe_foods, foreign_key: :recipe_id, class_name: 'Food', dependent: :destroy
  delegate :inventories, to: :user, prefix: true
  has_many :shopping_lists
end
