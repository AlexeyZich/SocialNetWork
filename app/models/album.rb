# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  albumable_type :string
#  albumable_id   :integer
#  title          :string
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_albums_on_albumable_type_and_albumable_id  (albumable_type,albumable_id)
#

class Album < ApplicationRecord
  belongs_to :albumable, polymorphic: true # User, Group
  has_many :photos, as: :imageable
  validates :title, format: { with: /\A[A-zА-я]+\z/, 
                            message: 'допустимы только буквы' }
  def user
    return albumable if albumable_type == 'User'
    albumable.user
  end
end
