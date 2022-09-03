class ShoppingList < ApplicationRecord
  belongs_to :inventory, class_name: 'Inventory', optional: true
  belongs_to :recipe, class_name: 'Recipe', optional: true
end
