class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @kits = Kit.all
    @restaurants = Restaurant.all
  end

  def about
  end

  def contact_us
  end

  def tc
  end
end
