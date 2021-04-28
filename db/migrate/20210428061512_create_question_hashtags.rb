class CreateQuestionHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :question_hashtags do |t|
      t.belongs_to :question, index: true
      t.belongs_to :hashtag, index: true

      t.timestamps
    end
  end
end
