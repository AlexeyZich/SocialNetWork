# == Schema Information
#
# Table name: friend_requests
#
#  id           :integer          not null, primary key
#  sender_id    :integer
#  recipient_id :integer
#  approved     :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_friend_requests_on_recipient_id                (recipient_id)
#  index_friend_requests_on_sender_id                   (sender_id)
#  index_friend_requests_on_sender_id_and_recipient_id  (sender_id,recipient_id) UNIQUE
#

class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'
end
