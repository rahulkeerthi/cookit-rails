class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @kits = Kit.all
    @restaurants = Restaurant.all
    @no_results = false
    search if params[:search]
  end

  def search
    @no_results = false
    @query = search_params[:query]
    @kits = Kit.search @query, fields: %i[name description ingredients], operator: "or", match: :word_start
    @restaurants = Restaurant.search @query, fields: %i[name city], operator: "or", match: :word_start
    @no_results = @kits.empty? && @restaurants.empty?
    tags = @kits.to_a.collect { |v| v.tags.to_a }.flatten
    @taglist = {}
    count = 0
    tags.each do |tag|
      @taglist[tag.name] ? @taglist[tag.name] += 1 : @taglist[tag.name] = 1
    end
  end

  def about
  end

  def contact_us
  end

  def tc
  end

  private

  def search_params
    params.require(:search).permit(:query)
  end
end
