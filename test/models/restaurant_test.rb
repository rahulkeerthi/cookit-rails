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
require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
