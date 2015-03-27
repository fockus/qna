require 'rails_helper'

RSpec.describe QuestionTag, :type => :model do
  it { should belong_to :tag }
  it { should belong_to :question }

  it { should validate_presence_of :question_id }
  it { should validate_presence_of :tag_id }

end
