class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])
  end

  def new; end

  def create; end

  def destroy
    recipe = Recipe.find(params[:id])
    user = User.find(recipe.user_id)
    recipe.destroy!
    user.save
    flash[:success] = 'You have deleted this Recipe successfully!'
    redirect_to user_recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
end
