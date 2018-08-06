# == Schema Information
#
# Table name: photos
#
#  id             :integer          not null, primary key
#  imageable_type :string
#  imageable_id   :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_photos_on_imageable_type_and_imageable_id  (imageable_type,imageable_id)
#

class Photo < ApplicationRecord
  belongs_to :imageable, polymorphic: true # Album, Post, Comment
  delegate :user, to: :imageable, allow_nil: true
  has_many :likes, as: :likeable
end
