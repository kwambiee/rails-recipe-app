class Inventory < ApplicationRecord
  validates :user_id, presence: false

  belongs_to :user
  has_many :inventory_foods
end
