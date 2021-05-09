class SearchController < ApplicationController
  def index
    if params[:query].start_with?('#')
      query = params[:query].gsub('#', '')
      @questions = Question.joins(:hashtags).where(hashtags: { name: query })
    else
      @questions = Question.where('text like ?', "%##{params[:query]}%")
    end
  end
end
