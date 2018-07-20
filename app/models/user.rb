class User < ApplicationRecord
  has_many :videos
  has_many :questions 
  has_many :questioned_videos, through: :questions, source: :video
  has_secure_password
  validates :username, :email, presence: true
  validates :username, uniqueness: { case_sensitive: false }
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true 
end
