class CreateYouLearns < ActiveRecord::Migration[6.0]
  def change
    create_table :you_learns do |t|
      t.string :title
      t.string :image

      t.timestamps
    end
  end
end
