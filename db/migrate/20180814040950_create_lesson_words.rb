class CreateLessonWords < ActiveRecord::Migration[5.2]
  def change
    create_table :lesson_words do |t|
      t.integer :word_id, foreign_key: true
      t.integer :word_answer_id, foreign_key: true
      t.integer :lesson_id, foreign_key: true

      t.timestamps
    end
  end
end
