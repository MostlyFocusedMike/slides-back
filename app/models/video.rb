class Video < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :questioning_users, through: :questions, source: :user
  has_many :slides
  has_many :video_topics
  has_many :topics, through: :video_topics
end
