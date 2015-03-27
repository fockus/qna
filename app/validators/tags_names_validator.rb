class TagsNamesValidator < ActiveModel::Validator
  def validate(record)
    unless record.tags_names.split(' ').all? { |name| Tag.new(:name => name).valid? }
      record.errors[:tags_names] << 'Tags are invalid.'
    end
  end
end