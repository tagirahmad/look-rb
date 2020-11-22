class LessonSerializer < ActiveModel::Serializer
  attributes :id, :title, :lesson_number, :preview_img, :description
  belongs_to :course, serializer: CourseSerializer
  belongs_to :category, serializer: CategorySerializer
end
