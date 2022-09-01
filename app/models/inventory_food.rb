class InventoryFood < ApplicationRecord
  validates :food_id, presence: true
  validates :inventory_id, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  belongs_to :inventory, class_name: 'Inventory'
  belongs_to :food, class_name: 'Food'
end
