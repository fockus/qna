require 'rails_helper'

RSpec.describe AnswersController, type: :controller do
  let (:answer) { create :answer }

  describe 'GET #index' do
    let (:question_with_answers) { create :question_with_answers }

    before { get :index, question_id: question_with_answers }

    it 'populates an array of all answers for question' do
      expect(assigns :answers).to match_array(question_with_answers.answers)
    end

    it { should render_template :index }
  end

  # describe 'GET #show' do
  #   before { get :show, id: question }

  #   it 'assigns the requested question to @question' do
  #     expect(assigns :question).to eq question
  #   end

  #   it { should render_template :show }
  # end

  # describe 'GET #new' do
  #   before { get :new }

  #   it 'assigns a new question to @question' do
  #     expect(assigns :question).to be_a_new(Question)
  #   end

  #   it { should render_template :new }
  # end

  # describe 'GET #edit' do
  #   before { get :edit, id: question }

  #   it 'assigns the requested question to @question' do
  #     expect(assigns :question).to eq question
  #   end

  #   it { should render_template :edit }
  # end

  # describe 'POST #create' do
  #   context 'with valid parameters' do
  #     it 'saves the new question to database' do
  #       expect { post :create, question: attributes_for(:question) }.to change(Question, :count).by(1)
  #     end

  #     it do
  #       post :create, question: attributes_for(:question)
  #       should redirect_to assigns :question
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'does not save the new question to database' do
  #       expect { post :create, question: attributes_for(:invalid_question) }.to_not change(Question, :count)
  #     end

  #     it do
  #       post :create, question: attributes_for(:invalid_question)
  #       should render_template :new
  #     end
  #   end
  # end

  # describe 'PATCH #update' do
  #   context 'with valid parameters' do
  #     it 'assigns the requested question to @question' do
  #       patch :update, id: question, question: attributes_for(:question)
  #       expect(assigns :question).to eq question
  #     end

  #     it 'alters question attributes' do
  #       new_title = 'Some new title, longer than 15 chars'
  #       new_body = 'This body actually should be longer than 30 characters'

  #       patch :update, id: question, question: { title: new_title, body: new_body }
  #       question.reload
  #       expect(question.title).to eq new_title
  #       expect(question.body).to eq new_body
  #     end

  #     it do
  #       patch :update, id: question, question: attributes_for(:question)
  #       should redirect_to question
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'does not save question to database' do
  #       expect { post :create, question: attributes_for(:invalid_question) }.to_not change(Question, :count)
  #     end

  #     it do
  #       post :create, question: attributes_for(:invalid_question)
  #       should render_template :new
  #     end
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   before { question }

  #   it 'deletes question' do
  #     expect {delete :destroy, id: question}.to change(Question, :count).by(-1)
  #   end

  #   it do
  #     delete :destroy, id: question
  #     should redirect_to questions_path
  #   end
  # end
end