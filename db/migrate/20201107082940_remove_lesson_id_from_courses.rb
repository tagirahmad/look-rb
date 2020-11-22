class RemoveLessonIdFromCourses < ActiveRecord::Migration[6.0]
  def change
    remove_column :courses, :lesson_id, :integer
  end
end
