class ShoppingList < ApplicationRecord
  belongs_to :inventory, class_name: 'Inventory'
  belongs_to :recipe, class_name: 'Recipe'
end
