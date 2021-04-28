class QuestionHashtag < ApplicationRecord
  belongs_to :questions
  belongs_to :hashtag
end
