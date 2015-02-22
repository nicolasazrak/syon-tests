class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|

      t.integer :question_id
      t.integer :submission_id
      t.string  :attachment

      t.timestamps null: false
    end

    add_foreign_key :answers, :questions
	add_foreign_key :answers, :submissions

  end
end
