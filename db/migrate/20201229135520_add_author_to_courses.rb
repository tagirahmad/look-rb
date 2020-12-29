class AddAuthorToCourses < ActiveRecord::Migration[6.0]
  def change
    add_reference :courses, :author, null: false, foreign_key: true
  end
end
