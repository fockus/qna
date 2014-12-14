class QuestionsController < ApplicationController
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
		@question = Question.new question_params
		@question.valid? ? save_and_notificate(question: @question, action: 'create') : render(action: 'new')
	end

	def update
		@question.assign_attributes(question_params)
		@question.valid? ? save_and_notificate(question: @question, action: 'update') : render(action: 'edit')
	end

	def destroy
		@question.destroy
		redirect_to questions_path
	end

	private

	def load_question
		render_404 unless @question = Question.where(id: params[:id]).eager_load(:tags).first
	end

	def question_params
		params.require(:question).permit(:title, :body, :tags_names)
	end

	def save_and_notificate(hash, question=hash[:question])
		question.assign_tags
		question.save
		if hash[:action] == 'update'
			redirect_to question, notice: 'Question was successfully updated.', action: 'index'
		elsif hash[:action] == 'create'
			redirect_to question, notice: 'Question was successfully created.', action: 'index'
		end
	end
end
