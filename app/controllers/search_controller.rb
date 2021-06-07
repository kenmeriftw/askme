class SearchController < ApplicationController
  def index
    @questions = Hashtag.find_by(name: params[:query].gsub('#', ''))&.questions
  end
end
