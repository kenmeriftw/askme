class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User', optional: true

  has_many :question_hashtags, dependent: :delete_all
  has_many :hashtags, through: :question_hashtags
  validates :text, presence: true

  # question text maximum length validation
  validates :text, length: { maximum: 255 }
end
