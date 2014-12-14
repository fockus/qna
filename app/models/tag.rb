class Tag < ActiveRecord::Base
	has_many	:question_tags, :dependent => :destroy
	has_many	:question, through: :question_tags

	validates :name,
						length: {in: 3..30}, presence: true
end
