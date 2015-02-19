class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|

      t.integer :applicant_id
      t.integer :test_id
      t.string :token
      t.timestamps null: false

    end

    add_foreign_key :submissions, :tests
	  add_foreign_key :submissions, :applicants


  end
end
