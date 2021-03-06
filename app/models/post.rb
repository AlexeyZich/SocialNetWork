# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  body          :text
#  postable_type :string
#  postable_id   :integer
#  repost_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_posts_on_postable_type_and_postable_id  (postable_type,postable_id)
#  index_posts_on_repost_id                      (repost_id)
#  index_posts_on_user_id                        (user_id)
#

class Post < ApplicationRecord
  belongs_to :author, foreign_key: :user_id, class_name: 'User'
  belongs_to :postable, polymorphic: true # User, Group
  belongs_to :repost, class_name: 'Post', optional: true
  has_many :likes, as: :likeable
  has_many :photos, as: :imageable

  validates :body, length: { maximum: 500 }

  # def repost?
  # end
end
