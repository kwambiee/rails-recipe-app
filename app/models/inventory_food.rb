class InventoryFood < ApplicationRecord
  validates :quantity, presence: true, numericality: { greater_than: 0 }

  belongs_to :inventory, class_name: 'Inventory', optional: true
  belongs_to :food, class_name: 'Food', optional: true
end
