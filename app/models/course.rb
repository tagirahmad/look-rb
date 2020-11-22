class Course < ApplicationRecord
  belongs_to :author, dependent: :destroy
  belongs_to :category
  has_many :lessons
  has_many :you_learns
end
