class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :question_hashtags
  has_many :hashtags, through: :question_hashtags, dependent: :destroy

  validates :text, presence: true

  # question text maximum length validation
  validates :text, length: { maximum: 255 }

  after_destroy :hashtags_delete
  after_update  :hashtags_delete

  def hashtags_delete
    Hashtag.left_outer_joins(:questions).where(questions: { id: nil }).destroy_all
  end
end
