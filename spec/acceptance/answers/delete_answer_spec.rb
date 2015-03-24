require 'rails_helper'

feature 'Delete Answer' do

  given(:user) { create(:user) }
  given(:another_user) { create(:user) }
  given(:question) { create(:question) }
  given(:answer) { create :answer, question: question, user: user }

  scenario 'author delete his answer' do
    sign_in user
    answer
    visit question_path(question)
    click_on 'Delete answer'

    expect(page).to have_no_content answer.comment
  end

  scenario 'another user cant delete answer' do
    sign_in user
    visit question_path(question)

    expect(page).to have_no_content 'Delete answer'
  end
end