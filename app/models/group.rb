# == Schema Information
#
# Table name: groups
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_groups_on_user_id  (user_id)
#

# groups_users
# user_id
# group_id

class Group < ApplicationRecord
  belongs_to :author, foreign_key: :user_id, class_name: 'User'
  has_and_belongs_to_many :users
  validates :title, format: { with: /\A[A-zА-я \d.!?]+\z/, 
                              message: 'допустимы только буквы' }
  has_many :albums, as: :albumable
  has_many :likes, as: :likeable
  has_many :posts, as: :postable

  scope :without_user, lambda { |u| where("#{quoted_table_name}.id NOT IN (SELECT groups_users.group_id FROM groups_users WHERE groups_users.user_id = ?)", u.id) }

end
