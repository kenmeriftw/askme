class Question < ApplicationRecord
  belongs_to :user

  validates :text, :user, presence: true
  # question text maximum length validation
  validates :text, length: { maximum: 255 }
end
