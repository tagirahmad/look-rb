class CategorySerializer < ActiveModel::Serializer
  attributes :name
  has_many :courses, key: :course, serializer: CourseSerializer
end
