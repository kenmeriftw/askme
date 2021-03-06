class Hashtag < ApplicationRecord
  has_many :question_hashtags
  has_many :questions, through: :question_hashtags

  validates :name, uniqueness: true

  scope :questioned, -> { where_exists(:questions) }
end
