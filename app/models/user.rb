class User < ApplicationRecord
  has_secure_password
  has_many :teams
  has_many :boards, through: :teams
  has_many :cards
  validates_presence_of :email
  validates_uniqueness_of :email
end
