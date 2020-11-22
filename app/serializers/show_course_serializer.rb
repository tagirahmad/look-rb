class ShowCourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  belongs_to :author, serializer: AuthorSerializer
  belongs_to :category, serializer: CategorySerializer
  has_many :lessons, serializer: LessonSerializer
  has_many :you_learns, serializer: YouLearnSerializer
end
