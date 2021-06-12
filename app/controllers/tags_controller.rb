class TagsController < ApplicationController
  def show 
      @questions = Hashtag.find_by!(name: params[:name]).questions
      raise ActiveRecord::RecordNotFound if @questions.empty?
  end
end
