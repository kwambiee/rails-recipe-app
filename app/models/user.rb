class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :inventories, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :recipes, foreign_key: :user_id, class_name: 'Recipe', dependent: :destroy
  has_many :foods, through: :recipe_foods, foreign_key: :recipe_id, class_name: 'Food', dependent: :destroy
end
