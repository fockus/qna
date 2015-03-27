require 'rails_helper'

RSpec.describe Question, :type => :model do
  it { should have_many :question }
  it { should have_many :question_tags }

  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_least(3).is_at_most(30) }

end
