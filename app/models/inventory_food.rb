class InventoryFood < ApplicationRecord
  validates :inventory_id, presence: false
  validates :inventory_id, :food_id, presence: false
  belongs_to :inventory
  belongs_to :food
end
