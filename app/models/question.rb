class Question < ActiveRecord::Base
	has_many :answers, dependent: :destroy
	has_many :tags, through: :question_tags
	has_many :question_tags, inverse_of: :question, :dependent => :destroy
  belongs_to :user
	attr_writer :tags_names

	validates :title, length: {in: 5..100}, presence: true
	validates :body, length: {in: 5..1000}, presence: true
	validates_with TagsNamesValidator

	# returns tags in string, separator space
	def tags_names
		@tags_names ||= self.tags.nil? ? '' : self.tags.collect(&:name).join(' ')
	end

	def assign_tags
		new_names = @tags_names.split(' ')
		# removes all tags in the model, except those that in new string
		self.tags.each do |tag|
			self.tags.delete tag if new_names.index { |s| s == tag.name }.nil?
			tag
		end
		# returns tag if he is, or he creates in model
		new_names.each do |tag_name|
			if self.tags.index { |s| s.name == tag_name }.nil?
				tag = Tag.where(name: tag_name).first
				self.tags.push(tag.nil? ? Tag.new(:name => tag_name) : tag)
			end
		end
	end

end
  