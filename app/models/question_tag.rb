class QuestionTag < ActiveRecord::Base
	belongs_to	:question
	belongs_to  :tag

	validates_presence_of :question
	validates_presence_of :tag

	accepts_nested_attributes_for :tag
end
