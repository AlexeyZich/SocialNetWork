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

class Group < ApplicationRecord
  belongs_to :user
  validates :title, format: { with: /\A[A-zА-я]+\z/, 
                              message: 'допустимы только буквы' }
  # has_many :likes, as: :likeable
end
