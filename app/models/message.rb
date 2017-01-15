# == Schema Information
#
# Table name: messages
#
#  id              :integer          not null, primary key
#  conversation_id :integer
#  user_id         :integer
#  body            :text
#  read            :boolean          default("false")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_messages_on_conversation_id  (conversation_id)
#  index_messages_on_user_id          (user_id)
#

class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  has_many :photos, as: :imageable

  validates :body, length: { maximum: 500 }
end
