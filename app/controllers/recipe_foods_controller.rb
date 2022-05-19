class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.where(user_id: current_user)
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    recipe_food = RecipeFood.new(recipe_food_params)
    recipe_food.food_id = params[:food_id]
    recipe_food.recipe_id = params[:recipe_id]

    redirect_to user_recipe_path(id: params[:recipe_id])
    if recipe_food.save
      flash[:success] = 'Ingredient was added!'
    else
      flash[:error] = 'ERROR, Ingredient already exist!'
    end
  end

  def destroy
    RecipeFood.find(params[:id]).destroy
    redirect_to user_recipe_path(Recipe.find(params[:recipe_id]))
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end
end
