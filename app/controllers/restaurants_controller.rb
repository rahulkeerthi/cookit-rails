class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_restaurant, only: %i[show destroy]

  def index
    @restaurants = Restaurant.includes(:kits).all
  end

  def show
    @restaurant_kits = @restaurant.kits
    if @restaurant.related_kits.empty?
      @related_kits = Kit.take(6)
      @unrelated = true
    else
      @related_kits = @restaurant.related_kits
      @unrelated = false
    end
  end

  def edit
  end

  def new
  end

  def update
    if @restaurant.update(restaurant_params)
      @restaurant
    else
      render 'edit'
    end
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      @restaurant
    else
      render 'new'
    end
  end

  def destroy
    @restaurant.destroy
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :city, :postcode, :address1, :address2, :delivery_options, :email, :twitter, :facebook, :instagram, :website_url, :contact_name, :logo, photos: [])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
