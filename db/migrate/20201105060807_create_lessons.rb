class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.string :title
      t.string :lesson_number
      t.string :preview_img
      t.string :description

      t.timestamps
    end
  end
end
