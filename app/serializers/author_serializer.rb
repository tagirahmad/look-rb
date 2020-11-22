class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :about
  has_many :courses, serializer: CourseSerializer
end
