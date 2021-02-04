class Course < ApplicationRecord
  belongs_to :author, dependent: :destroy
  belongs_to :category
  has_many :lessons
  has_many :you_learns
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :trailer, presence: true
  validates :image, presence: true

  # scope :with_lessons, -> { eager_load(:lessons) }
  # scope :with_name, -> { eager_load(:name) }
end
