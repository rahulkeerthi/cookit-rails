class KitsController < ApplicationController
  before_action :set_kit, only: %i[show related_by_tag related_by_restaurant destroy]

  def index
    @kits = Kit.all
  end

  def show
  end

  def edit
  end

  def new
  end

  def update
    if @kit.update(kit_params)
      @kit
    else
      render 'edit'
    end
  end

  def related_by_tag
    tags = @kit.tags
    similar_kits = Hash.new(0)

    tags.each do |tag|
      tag.kits.each do |kit|
        similar_kits[kit] += 1 unless kit == @kit
      end
    end

    most_similar_kits = similar_kits.sort_by { |_k, v| -v }

    @related_by_tag = most_similar_kits.slice!(0, 3).to_h.keys
  end

  def related_by_restaurant
    @restaurant = @kit.restaurant
    @restaurant_kits = @restaurant.kits
  end

  def create
    @kit = Kit.new(kit_params)
    if @kit.save
      @kit
    else
      render 'new'
    end
  end

  def destroy
    @kit.destroy
  end

  private

  def kit_params
    params.require(:kit).permit(:name, :description, :ingredients, :link_url, :price, :restaurant_id, tags: [], photos: [])
  end

  def set_kit
    @kit = Kit.find(params[:id])
  end
end
