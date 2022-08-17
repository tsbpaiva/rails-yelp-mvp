class RestaurantsController < ApplicationController
  # index, show, new, edit, create, update, and destroy
  def index
    @restaurants = Restaurant.all
  end

  def new # only for the form to work, it will be empty forever :/
    @restaurant = Restaurant.new
  end

  # using data acquired by form create a new rest that will, indeed, serve for something
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :category, :address, :phone_number)
  end



end
