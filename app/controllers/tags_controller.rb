class TagsController < ApplicationController
  def show 
      @questions = Hashtag.find_by!(name: params[:name]).questions
  end
end
