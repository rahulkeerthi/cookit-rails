# == Schema Information
#
# Table name: restaurant_tags
#
#  id            :bigint           not null, primary key
#  restaurant_id :bigint           not null
#  tag_id        :bigint           not null
#
# Indexes
#
#  index_restaurant_tags_on_restaurant_id  (restaurant_id)
#  index_restaurant_tags_on_tag_id         (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (restaurant_id => restaurants.id)
#  fk_rails_...  (tag_id => tags.id)
#
class RestaurantTag < ApplicationRecord
  belongs_to :restaurant
  belongs_to :tag
end
