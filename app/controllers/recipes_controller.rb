class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.all
  end

  def show
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.find(params[:id])
  end

  def new; end

  def create; end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy!
    flash[:success] = 'Recipe deleted successfully!'
    redirect_to user_recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
end
