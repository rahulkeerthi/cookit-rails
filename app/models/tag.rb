# == Schema Information
#
# Table name: tags
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Tag < ApplicationRecord
  has_many :restaurant_tags
  has_many :restaurants, through: :restaurant_tags
  has_many :kit_tags
  has_many :kits, through: :kit_tags

  validates :name, presence: true, length: { minimum: 3 }
end
