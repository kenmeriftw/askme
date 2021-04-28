class Hashtag < ApplicationRecord
  has_many :question_hashtags
  has_many :questions, through: :question_hashtags

  def collection
    @Hashtag.all.map(&:name)
  end
end
