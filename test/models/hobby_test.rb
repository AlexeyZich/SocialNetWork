# == Schema Information
#
# Table name: hobbies
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  value       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_hobbies_on_user_id  (user_id)
#  index_hobbies_on_value    (value) UNIQUE
#

require 'test_helper'

class HobbyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
