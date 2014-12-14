require 'rails_helper'

RSpec.describe Question, :type => :model do
  it { should validate_presence_of :question }
  it { should validate_presence_of :tag }

  it { should belong_to :tag }
  it { should belong_to :question }

end

