class User < ApplicationRecord
  has_many :videos
  has_many :questions 
  has_many :questioned_videos, through: :questions, source: :video
  has_secure_password
end
