class QuestionsController < ApplicationController
  before_action :load_question, only: %i[show edit update destroy]
  before_action :authorize_user, except: :create

  def edit; end

  def create
    @question = Question.new(question_params)
    @question.author = current_user
    extractor = HashtagExtractor.new(@question)

    if check_captcha(@questions) && @question.save
      extractor.create_hashtag_from_text
      redirect_to user_path(@question.user), notice: 'Вопрос задан'
    else
      render :edit
    end
  end

  def update
    extractor = HashtagExtractor.new(@question)
    if @question.update(question_params)
      extractor.create_hashtag_from_answer(question)
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
  
  def check_captcha(model)
    if current_user.present?
      true
    else
      verify_recaptcha(model: model)
    end
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
