class Slide < ApplicationRecord
  belongs_to :video
  has_many :sections
end
