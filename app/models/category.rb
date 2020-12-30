class Category < ApplicationRecord
  has_many :courses
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
end
