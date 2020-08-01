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
require 'test_helper'

class KitTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
