class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @kits = Kit.all
    @restaurants = Restaurant.all
  end
end
