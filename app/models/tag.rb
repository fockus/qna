class Tag < ActiveRecord::Base
	has_many	:question_tags, :dependent => :destroy
	has_many	:question, through: :question_tags

	validates :name,
            presence: true,
						validates_length_of: { minimum: 3, maximum: 30 }
end
