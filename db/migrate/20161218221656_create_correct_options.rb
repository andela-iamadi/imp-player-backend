class CreateCorrectOptions < ActiveRecord::Migration
  def change
    create_table :correct_options do |t|
      t.integer :question_id
      t.integer :option_id
      t.timestamps null: false
    end
  end
end
