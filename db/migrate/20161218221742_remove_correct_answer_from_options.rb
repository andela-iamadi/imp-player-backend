class RemoveCorrectAnswerFromOptions < ActiveRecord::Migration
  def change
    remove_column :options, :correct
  end
end
