class Topic < ApplicationRecord
  has_many :video_topics
  has_many :videos, through: :video_topics
end
