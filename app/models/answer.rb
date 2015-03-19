class Answer < ActiveRecord::Base
	belongs_to	:question
  belongs_to :user

	validates :comment, length: {in: 5..1000}, presence: true

end
  