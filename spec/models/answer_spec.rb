require 'rails_helper'

RSpec.describe Answer, :type => :model do
  it { should belong_to :question }
  it { should validate_presence_of :question }

  it { should validate_presence_of :comment }
  it { should ensure_length_of(:comment).is_at_least(5).is_at_most(1000) }

end

