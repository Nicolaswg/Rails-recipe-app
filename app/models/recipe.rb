class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id'
  validates :name, presence: true
  validates :description, presence: true
end
