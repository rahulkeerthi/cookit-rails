class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: [:favourites]
  invisible_captcha only: [:contact_us]

  def home
    @kits = Kit.order(created_at: :desc).page(params[:kit_page])
    @restaurants = Restaurant.order(created_at: :desc).page(params[:restaurant_page])
    @no_results = false
    search if params[:search]
  end

  def about
  end

  def contact
    @contact = Contact.new
  end

  def tc
  end

  def new
    @kits = Kit.order(created_at: :desc).limit(6)
    @restaurants = Restaurant.order(created_at: :desc).limit(6)
  end

  def popular
    @kits = Kit.first(6)
  end

  def favourites
  end

  private

  def search
    @no_results = false
    @query = search_params[:query]
    @kits = Kit.search @query, fields: %i[name ingredients kit_tags], operator: "or", match: :word_start
    @restaurants = Restaurant.search @query, fields: %i[name description city restaurant_tags], operator: "or", match: :word_start
    @no_results = @kits.empty? && @restaurants.empty?
    tags = @kits.to_a.collect { |v| v.tags.to_a }.flatten
    @taglist = {}
    tags.each do |tag|
      @taglist[tag.name] ? @taglist[tag.name] += 1 : @taglist[tag.name] = 1
    end
  end

  def search_params
    params.require(:search).permit(:query)
  end
end
