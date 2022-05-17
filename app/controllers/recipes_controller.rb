class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show; end

  def new; end

  def create; end

  def destroy; end
end
