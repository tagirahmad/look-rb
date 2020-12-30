class Lesson < ApplicationRecord
  belongs_to :course
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :preview_img, presence: true
  validates :lesson_number, presence: true
end