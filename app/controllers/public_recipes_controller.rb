class PublicRecipesController < ApplicationController
  def index
    @recipe = Recipe.where(public: true).order(created_at: :desc).includes(:user, :recipe_foods,
                                                                           recipe_foods: [:food])
  end
end
