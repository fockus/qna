class Tag < ActiveRecord::Base
	has_many	:question_tags, :dependent => :destroy
	has_many	:question, through: :question_tags

	validates :name,
            presence: true,
            length: { minimum: 3, maximum: 30 }
end
