require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  let(:user) { create :user }
  let(:question) { create :question }
  let(:questions) { create_list(:question, 3) }

  describe 'GET #index' do

    before { get :index }

    it 'populates an array of all questions' do
      expect(assigns :questions).to match_array(questions)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end


  describe 'GET #show' do
    before { get :show, id: question }

    it 'assigns questions to @question' do
      expect(assigns(:question)).to eq question
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end


  describe 'authorized user GET #new' do
    sign_in_user
    before { get :new }

    it 'assigns new question to @question' do
      expect(assigns(:question)).to be_a_new(Question)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end


  describe 'non-authorized user GET #new' do
    before { get :new }
    it 'redirect to log in form' do
      expect(response).to redirect_to new_user_session_path
    end
  end


  describe 'authorized user GET #edit' do
    sign_in_user
    before { get :edit, id: question }

    it 'assigns requested question to @question' do
      expect(assigns(:question)).to eq question
    end

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'non-authorized user GET #edit' do
    before { get :edit, id: question}
    it 'resirect to log in form' do
      expect(response).to redirect_to new_user_session_path
    end
  end


  describe 'authorized user POST #create' do
    sign_in_user
    context 'with valid attribures' do
      it 'saves the new question on the database' do
        expect { post :create, question: attributes_for(:question) }.to change(Question, :count).by(1)
      end

      it 'redirect to show view' do
        post :create, question: attributes_for(:question)
        expect(response).to redirect_to question_path(assigns(:question))
      end
    end

    context 'with invalid attributes' do
      it 'does not save new question on the database' do
        expect { post :create, question: attributes_for(:invalid_question) }.to_not change(Question, :count)
      end

      it 're-render new view' do
        post :create, question: attributes_for(:invalid_question)
        expect(response).to render_template :new
      end
    end
  end


  describe 'non-authorized user POST #create' do
    context 'with valid attr' do
      it 'dont save and redirect to new_user_session_path' do
        expect { post :create, question: attributes_for(:question) }.to_not change(Question, :count)
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'with invalid attr' do
      it 'dont save and redirect to new_user_session_path' do
        expect { post :create, question: attributes_for(:invalid_question) }.to_not change(Question, :count)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end


  describe 'authorized user PATCH #update' do
    sign_in_user
    context 'with valid attr' do
      it 'assigns the requested question with @question' do
        patch :update, id: question, question: attributes_for(:question)
        expect(assigns(:question)).to eq question
      end

      it 'changes question attributes' do
        patch :update, id: question, question: { title: 'new title', body: 'new body'}
        question.reload
        expect(question.title).to eq 'new title'
        expect(question.body).to eq 'new body'
      end

      it 'redirect to the updated question' do
        patch :update, id: question, question: attributes_for(:question)
        expect(response).to redirect_to question
      end
    end

    context 'invalid attributes' do
      before { patch :update, id: question, question: { title: 'new title', body: nil } }

      it 'does not change question attributes' do
        question.reload
        expect{question}.to_not change{Question.count}
      end

      it 're-render edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'non-authorized user PATCH #update' do
    context 'with valid attr' do
      it 'not assigns the requested question with @question' do
        patch :update, id: question, question: attributes_for(:question)
        expect(response).to redirect_to new_user_session_path
      end

      it 'changes question attributes' do
        patch :update, id: question, question: { title: 'new title', body: 'new body'}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end


  describe 'authorized user DELETE #destroy' do
    sign_in_user
    it 'delete his question from database' do
      question_for_del = Question.create(title: question.title, body: question.body, user_id: @user.id)
      expect { delete :destroy, id: question_for_del }.to change(Question, :count).by(-1)
      expect(response).to redirect_to questions_path
    end

    it 'delete other question from database' do
      question = Question.create(title: 'Fish question', body: 'Fish text', user_id: user)
      expect{ delete :destroy, id: question }.to_not change(Question, :count)
    end
  end

  describe 'non-authorized user DELETE #destroy' do
    it 'not delete his question from database' do
      question
      expect { delete :destroy, id: question }.to_not change(Question, :count)
    end
  end

end