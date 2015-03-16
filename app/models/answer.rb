class Answer < ActiveRecord::Base
	belongs_to	:question

	validates :comment, length: {in: 5..1000}, presence: true

end
  