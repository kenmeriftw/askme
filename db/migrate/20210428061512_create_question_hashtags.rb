class CreateQuestionHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :question_hashtags do |t|
      t.belongs_to :questions, index: true
      t.belongs_to :hashtags, index: true

      t.timestamps
    end
  end
end
