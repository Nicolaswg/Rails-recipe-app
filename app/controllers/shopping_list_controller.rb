class ShoppingListController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
    @total_value = 0
    @total_items = 0
    @recipe_foods.each do |f|
      @total_value += f.quantity * f.food.price
      @total_items += 1
    end
  end
end
