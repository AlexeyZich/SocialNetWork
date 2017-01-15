# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  surname                :string
#  age                    :integer
#  male                   :boolean
#  country                :string
#  city                   :string
#  description            :text
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :friend_requests, foreign_key: :requesting_user_id
  has_many :groups
  has_many :albums, as: :albumable
  has_many :posts, as: :postable
  has_many :likes, as: :likeable
  has_and_belongs_to_many :hobbies

  MALE_SET = [['Мужской', 1], ['Женский', 0]].freeze

  validates :name, length: { in: 2..15}, format: { with: /\A[A-zА-я]+\z/,
                           message: 'допустимы только буквы' }
  # validates :surname, length: { in: 2..20},  format: { with: /\A[A-zА-я]+\z/, 
  #                             message: 'допустимы только буквы' }
  # validates :age, numericality: true
  # validates :country, format: { with: /\A[A-zА-я]+\z/, 
  #                             message: 'допустимы только буквы' }
  # validates :city, format: { with: /\A[A-zА-я]+\z/, 
  #                          message: 'допустимы только буквы' }
  def conversations
    Conversation.where('sender_id = ? OR recipient_id = ?', id, id)
  end
end
