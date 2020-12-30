class YouLearn < ApplicationRecord
  belongs_to :course
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :image, presence: true
end
