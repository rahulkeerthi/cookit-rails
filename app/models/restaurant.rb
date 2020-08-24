# == Schema Information
#
# Table name: restaurants
#
#  id               :bigint           not null, primary key
#  address1         :string
#  address2         :string
#  city             :string
#  contact_name     :string
#  delivery_options :string
#  description      :text
#  email            :string
#  facebook         :string
#  instagram        :string
#  kits_count       :integer
#  map_lat          :float
#  map_long         :float
#  name             :string
#  postcode         :string
#  twitter          :string
#  website_url      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'uri'

class Restaurant < ApplicationRecord
  searchkick word_start: [:name]
  paginates_per 6
  has_many :restaurant_tags
  has_many :tags, through: :restaurant_tags
  has_many_attached :photos
  has_one_attached :logo
  has_many :kits, dependent: :destroy

  validates :name, presence: true, length: { minimum: 6 }
  validates :description, presence: true, length: { minimum: 20 }

  # ? should we split out locations (is that useful information?)
  validates :city, presence: true, length: { minimum: 3 }
  # uses the UK gov post code RegExp to validate
  validates :postcode, presence: true, format: { with: /([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})/, message: 'Not a valid UK post code' }
  validates :address1, presence: true, length: { minimum: 10 }

  # URI.regexp provides built-in regexp for different URL types (in this case, http and https)
  validates :website_url, presence: true, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }
  validates :email, allow_blank: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'Not a valid email address' }

  def search_data
    {
      name: name,
      description: description,
      city: city,
      restaurant_tags: tags.map(&:name)
    }
  end

  def kit_count
    kits.count
  end

  def logo_service_url
    logo.service_url
  end

  def related_kits
    kits = Kit.where.not(restaurant: self)
    own_tags = tags.map(&:name)
    selected = kits.select do |kit|
      (kit.tags.map(&:name) & own_tags).any?
    end
    selected.first(6)
  end
end
