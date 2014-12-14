class TagsNamesValidator < ActiveModel::Validator
  def validate(record)
    unless record.tags_names.split(' ').all? { |name| Tag.new(:name => name).valid? }
      record.errors[:tags_names] << ' are invalid.'
    end
  end
end