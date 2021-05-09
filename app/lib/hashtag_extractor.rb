class HashtagExtractor
  HASHTAG_REGEXP = /#[[:word:]-]+/

  def initialize(question)
    @question = question
  end

  def create_hashtags
    extract_hashtags.each do |word|
      @question.hashtags.find_or_create_by(name: word)
    end
  end

  private

  def extract_hashtags
    "#{@question.text} #{@question.answer}".downcase.scan(HASHTAG_REGEXP).map{ |n| n.gsub('#', '') }
  end
end
