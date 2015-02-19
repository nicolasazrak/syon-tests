class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|

      t.string :title
      t.string :description
      t.datetime :duration
      t.integer :test_id
      t.string :attachment

      t.timestamps null: false
      
    end

    add_foreign_key :questions, :tests

  end
end
