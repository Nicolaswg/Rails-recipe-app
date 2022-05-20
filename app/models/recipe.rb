class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, foreign_key: 'recipe_id'
  validates :name, presence: true
  validates :description, presence: true
	validates :preparation_time, numericality: { only_float: true, greater_than_or_equal_to: 0 }
	validates :cooking_time, numericality: { only_float: true, greater_than_or_equal_to: 0 }
	validates_inclusion_of :public, :in => [true, false]

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
