# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  likeable_type :string
#  likeable_id   :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_likes_on_likeable_id_and_likeable_type  (likeable_id,likeable_type) UNIQUE
#  index_likes_on_likeable_type_and_likeable_id  (likeable_type,likeable_id)
#  index_likes_on_user_id                        (user_id)
#

class Like < ApplicationRecord
  belongs_to :likeable, polymorphic: true # Comment, Post, Photo, User, Group
  belongs_to :user
  has_many :likes, as: :likeable
end
