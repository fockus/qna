class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|

    	t.references :question, index: true, null: false
    	t.references :tag, index: true, null: false

      t.timestamps
    end

    add_foreign_key :question_tags, :questions
    add_foreign_key :question_tags, :tags
  end
end
