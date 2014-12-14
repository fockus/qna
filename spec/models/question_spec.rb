require 'rails_helper'

RSpec.describe Question, :type => :model do
  it { should have_many :tags }
  it { should have_many :question_tags }

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }

  it { should ensure_length_of(:title).is_at_least(5).is_at_most(100) }
  it { should ensure_length_of(:body).is_at_least(5).is_at_most(1000) }

end

