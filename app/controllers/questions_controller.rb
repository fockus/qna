class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :load_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.all.eager_load :tags
  end

  def show
  end

  def new
    @question = Question.new
  end

  def edit
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      redirect_to @question, notice: 'Your question successfully create.'
    else
      flash[:notice] = 'You must fill all fields.'
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Your question successfully update.'
    else
      render(action: 'edit')
    end
  end

  def destroy
    if @question.user_id == current_user.id
      @question.destroy
      redirect_to questions_path, notice: 'You question successfully deleted.'
    else
      redirect_to questions_path, notice: 'You can\'t delete this question.'
    end
  end

  private

  def load_question
    render_404 unless @question = Question.where(id: params[:id]).eager_load(:tags).first
  end

  def question_params
    params.require(:question).permit(:title, :body, :tags_names)
  end

end
