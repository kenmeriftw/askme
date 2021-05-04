class HashtagExtractor
  HASHTAG_REGEXP = /#[[:word:]-]+/

  def initialize(question)
    @question = question
  end

  def create_hashtags
    @question&.hashtags.delete_all
    @question.hashtags_delete
    extract_hashtags.each do |word|
      @question.hashtags.find_or_create_by(name: word.downcase)
    end
  end

  private
  
  def extract_hashtags
    (@question.text.to_s + " " + @question&.answer.to_s).scan(HASHTAG_REGEXP).map{ |n| n.gsub("#", "")}
  end
end
