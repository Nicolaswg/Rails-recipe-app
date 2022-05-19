class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id'
  validates :name, presence: true
  validates :description, presence: true

	def amount_of_food
		recipe_foods.length
	end

	def total
		total_price = 0
		recipe_foods.each do |item|
			total_price += item.quantity * item.food.price
		end
		total_price
	end
end
