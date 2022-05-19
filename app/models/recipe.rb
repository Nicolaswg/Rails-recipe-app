class Recipe < ApplicationRecord
  belongs_to :user, class_name: "User"
	has_many :recipe_foods, foreign_key: 'recipe_id', class_name: 'RecipeFood'

  validates :name, presence: true
  validates :description, presence: true
end
