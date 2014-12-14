class Question < ActiveRecord::Base
	has_many :tags, through: :question_tags
	has_many :question_tags, inverse_of: :question, :dependent => :destroy
	attr_writer :tags_names

	validates :title,
						validates_length_of: {in: 5..100}, presence: true

	validates :body,
						validates_length_of: {in: 5..1000}, presence: true

	#validates_with TagsNamesValidator

	def tags_names
		@tags_names ||= self.tags.nil? ? '' : self.tags.collect(&:name).join(' ')
	end

	def assign_tags
		new_names = @tags_names.split(' ')
		self.tags.each do |tag|
			self.tags.delete tag if new_names.index { |s| s == tag.name }.nil?
			tag
		end
		new_names.each do |tag_name|
			if self.tags.index { |s| s.name == tag_name }.nil?
				tag = Tag.where(name: tag_name).first
				self.tags.push(tag.nil? ? Tag.new(:name => tag_name) : tag)
			end
		end
	end

end
  