class YouLearnSerializer < ActiveModel::Serializer
  attributes  :title, :image
  belongs_to :course, serializer: CourseSerializer
end
