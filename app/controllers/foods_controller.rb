class FoodsController < ApplicationController
  def index
    @user = User.includes(:foods).find(params[:user_id])
  end

  def show; end

  def new
    respond_to do |format|
      format.html { render :new }
    end
  end

  def create
    food = Food.new(food_params)
    food.user_id = params[:user_id]
    respond_to do |format|
      format.html do
        if food.save
          redirect_to "/users/#{food.user_id}/foods"
          flash[:success] = 'Food added correctly'
        else
          redirect_to "/users/#{food.user_id}/foods/new"
          flash[:error] = 'ERROR! food wasn\'t added'
        end
      end
    end
  end

  def destroy
    food = Food.find(params[:id])
    food.destroy!
    redirect_to user_foods_path
  end

  private

  def food_params
    params.require(:foods).permit(:name, :measurement_unit, :price)
  end
end
