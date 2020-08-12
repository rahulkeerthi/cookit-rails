class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @kits = Kit.all
    @restaurants = Restaurant.all
    if params[:search]
      @query = params[:search][:query]
      @kits = Kit.search @query, fields: %i[name description ingredients], operator: "or", match: :word_start
      @restaurants = Restaurant.search @query, fields: %i[name city], operator: "or", match: :word_start
      @tags = Tag.search @query, operator: "or", match: :word_start
    end
  end

  def about
  end

  def contact_us
  end

  def tc
  end
end
