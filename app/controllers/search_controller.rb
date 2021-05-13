class SearchController < ApplicationController
  def index
    @questions = Question.where_exists(:hashtags, name: params[:query].gsub('#', ''))
  end
end
