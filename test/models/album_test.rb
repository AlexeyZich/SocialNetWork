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

require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
