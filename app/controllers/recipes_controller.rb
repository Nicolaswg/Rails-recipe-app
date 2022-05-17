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

  def destroy; end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
end
