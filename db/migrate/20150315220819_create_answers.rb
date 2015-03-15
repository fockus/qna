class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :comment, null: false

      t.timestamps
    end
  end
end
