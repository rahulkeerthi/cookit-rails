# == Schema Information
#
# Table name: kits
#
#  id            :bigint           not null, primary key
#  counter       :integer          default(0), not null
#  description   :text
#  ingredients   :string
#  link_url      :string
#  name          :string
#  price         :float
#  serves_count  :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  restaurant_id :bigint           not null
#
# Indexes
#
#  index_kits_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_...  (restaurant_id => restaurants.id)
#
require 'uri'
class Kit < ApplicationRecord
  searchkick word_start: [:name]
  belongs_to :restaurant, counter_cache: true
  has_many :kit_tags
  has_many :tags, through: :kit_tags
  has_many_attached :photos

  validates :name, presence: true, length: { minimum: 6 }
  validates :description, presence: true, length: { minimum: 20 }

  # * prices are floats
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, message: "Price can't be negative!" }

  # URI.regexp provides built-in regexp for different URL types (in this case, http and https)
  validates :link_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }

  def restaurant_photos
    photos = []
    restaurant.photos.each do |photo|
      photos << photo.service_url
    end
    photos
  end

  def restaurant_name
    restaurant.name
  end

  def restaurant_delivery_options
    restaurant.delivery_options
  end

  # TODO: ingredients is currently a string - should we save as an stringified array or a text description or...? Might be some value in storing ingredients to enable a polymorphic search (restaurants, kits, ingredients, descriptions, locations, etc.)
  # TODO: how do we implement delivery options? Each kit should only have one (i.e. all mutually exclusive), but each restaurant might have one or more (UK delivery, EU delivery, click and collect, etc.) if the kits have different options. We could do a look-up from kits to a delivery_options table. At some point, we will need to bubble up these options from the kits to the relevant restaurant so we can display one or more options available with that restaurant (e.g. "We do Click and Collect and UK Delivery")
end
