class FoodsController < ApplicationController
  def index
	@user = User.includes(:foods).find(params[:user_id])
	@food = @user.foods
	end

  def show; end

  def new
		respond_to do |format|
			format.html {render :new}
		end
	end

  def create
		respond_to do |format|
			format.html do
				values = params.require(:foods).permit(:name, :unit, :price)
				food = Food.new(name: values[:name], measurement_unit: values[:unit], price: values[:price])
				food.user_id = params[:user_id]
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
		print food
		redirect_to user_foods_path(params[:user_id]), notice: 'Food deleted correctly'
	end
end
