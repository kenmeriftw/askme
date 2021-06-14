class TagsController < ApplicationController
  def show 
      @questions = Hashtag.questioned.find_by!(name: params[:name]).questions
  end
end
