class Author < ApplicationRecord
  has_many :courses
  validates :first_name, presence: true, length: { minimum: 6, maximum: 20 }
  validates :last_name, presence: true, length: { minimum: 6, maximum: 20 }
  validates :about, presence: true, length: { minimum: 10, maximum: 300 }
end
