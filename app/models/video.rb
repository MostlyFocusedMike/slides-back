class Video < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :questioning_users, through: :questions, source: :user
  has_many :slides
end
