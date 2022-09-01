class Inventory < ApplicationRecord
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }


  belongs_to :user, class_name: 'User'
  has_many :inventory_foods, foreign_key: :inventory_id, class_name: 'InventoryFood', dependent: :destroy
  has_many :foods, through: :inventory_foods, foreign_key: :inventory_id, class_name: 'Food', dependent: :destroy
  has_many :recipes, through: :user, foreign_key: :inventory_id, class_name: 'Recipe', dependent: :destroy
  has_many :shopping_lists, foreign_key: :inventory_id, class_name: 'ShoppingList', dependent: :destroy
end
