class HashtagExtractor
  HASHTAG_REGEXP = /#[[:word:]-]+/

  def initialize(question)
    @question = question
  end

  def create_hashtag_from_answer
    extract_hashtag_from_answer.each do |word|
      @question.hashtags.create(name: word.downcase)
    end
  end

  def create_hashtag_from_text
    extract_hashtag_from_text.each do |word|
      @question.hashtags.create(name: word.downcase)
    end
  end

  def extract_hashtag_from_answer
    @question.answer.to_s.scan(HASHTAG_REGEXP).map{ |n| n.gsub("#", "")} 
  end

  def extract_hashtag_from_text
    @question.text.to_s.scan(HASHTAG_REGEXP).map{ |n| n.gsub("#", "")} 
  end
end
