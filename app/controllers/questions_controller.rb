class QuestionsController < ApplicationController
  before_action :load_question, only: %i[show edit update destroy hashtag_extractor_text hashtag_from_extractor_answer]
  before_action :authorize_user, except: [:create]

  after_action :hashtag_creator_text, only: :create
  after_action :hashtag_creator_answer, only: :update

  HASHTAG_REGEXP = /#[[:word:]-]+/

  def edit; end

  def create
    @question = Question.new(question_params)
    @question.author = current_user

    if @question.save
      redirect_to user_path(@question.user), notice: 'Вопрос задан'
    else
      render :edit
    end
  end

  def update
    if @question.update(question_params)
      redirect_to user_path(@question.user), notice: 'Вопрос сохранен'
    else
      render :edit
    end
  end

  def destroy
    user = @question.user
    @question.destroy

    redirect_to user_path(user), notice: 'Вопрос удален'
  end

  private

  def authorize_user
    reject_user unless @question.user == current_user
  end

  def hashtag_creator_answer
    hashtag_extractor_answer.each do |word|
      @question.hashtags.create(name: word)
    end
  end

  def hashtag_creator_text
    hashtag_extractor_text.each do |word|
      @question.hashtags.create(name: word)
    end
  end

  def hashtag_extractor_answer
    @question.answer.to_s.scan(HASHTAG_REGEXP).map{ |n| n.gsub("#", "")} 
  end

  def hashtag_extractor_text
    @question.text.to_s.scan(HASHTAG_REGEXP).map{ |n| n.gsub("#", "")} 
  end

  def load_question
    @question = Question.find(params[:id])
  end

  def question_params
    if current_user.present? && params[:question][:user_id].to_i == current_user.id
      params.require(:question).permit(:user_id, :text, :answer)
    else
      params.require(:question).permit(:user_id, :text)
    end
  end
end
