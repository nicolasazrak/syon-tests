class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|

      t.string :description
      t.integer :submissions_count

      t.timestamps null: false
    end
  end
end
