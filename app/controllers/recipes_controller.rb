class RecipesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.all
  end

  def show
    @user = User.find(params[:user_id])
    @recipes = @user.recipes.find(params[:id])
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    @recipe.user_id = params[:user_id]
    respond_to do |format|
      if @recipe.save!
        format.html { redirect_to user_recipe_path(@recipe.user_id, @recipe.id), notice: 'Recipe created successfully!' }
      else
        format.html { redirect_to new_user_recipes_path, alert: 'Failed to create recipe' }
      end
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy!
    redirect_to user_recipes_path, notice: 'Recipe deleted successfully!'
  end

  private

  def recipe_params
    params.require(:recipes).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
