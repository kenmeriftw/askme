class TagsController < ApplicationController
  def show 
    begin
      @questions = Hashtag.find_by(name: params[:name]).questions
    rescue => exception
      raise ActiveRecord::RecordNotFound
    end
  end
end
