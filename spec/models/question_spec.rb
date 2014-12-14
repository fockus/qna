require 'rails_helper'

RSpec.describe Question, :type => :model do
  #it { should validate_presence_of :title }
  #it { should validate_presence_of :body }

  it 'has a valid factory' do
    expect(build(:question)).to be_valid
  end

  it 'is invalid without title' do
    expect(build(:question, title: nil)).not_to be_valid
  end

  it 'is invalid without body' do
    expect(build(:question, body: nil)).not_to be_valid
  end

  it "validates its title and makes sure that it's empty or it's consisted of 5-100 symbols" do

    expect(build(:question, title: '@' * 4 )).not_to be_valid
    expect(build(:question, title: '@' * 101 )).not_to be_valid

    expect(build(:question, title: '@' * 5 )).to be_valid
    expect(build(:question, title: '@' * 100 )).to be_valid

  end

  it "validates its body and makes sure that it's empty or it's consisted of 5-1000 symbols" do

    expect(build(:question, body: '@' * 4 )).not_to be_valid
    expect(build(:question, body: '@' * 1001 )).not_to be_valid

    expect(build(:question, body: '@' * 5 )).to be_valid
    expect(build(:question, body: '@' * 1000 )).to be_valid

  end

end

