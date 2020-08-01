# == Schema Information
#
# Table name: kit_tags
#
#  id     :bigint           not null, primary key
#  kit_id :bigint
#  tag_id :bigint           not null
#
# Indexes
#
#  index_kit_tags_on_kit_id  (kit_id)
#  index_kit_tags_on_tag_id  (tag_id)
#
# Foreign Keys
#
#  fk_rails_...  (kit_id => kits.id)
#  fk_rails_...  (tag_id => tags.id)
#
class KitTag < ApplicationRecord
  belongs_to :kit
  belongs_to :tag
end
