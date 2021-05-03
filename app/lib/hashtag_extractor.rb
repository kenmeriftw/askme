class HashtagExtractor
  HASHTAG_REGEXP = /#[[:word:]-]+/

  def initialize(question)
    @question = question
  end

  def create_hashtags
    @question&.hashtags.destroy_all
    extract_hashtags.each do |word|
      @question.hashtags.create(name: word.downcase) unless Hashtag.exists?(name: word)
    end
  end

  def extract_hashtags
    @question.answer.to_s.scan(HASHTAG_REGEXP).map{ |n| n.gsub("#", "")} + 
      @question.text.to_s.scan(HASHTAG_REGEXP).map{ |n| n.gsub("#", "")}
  end

  def sanitize_hashtags
    
  end
end
