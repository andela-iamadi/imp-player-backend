class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :content
      t.boolean :correct
      t.integer :question_id

      t.timestamps null: false
    end
  end
end
