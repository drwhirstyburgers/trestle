class AddCorrectAnsweToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :correct_answer, :integer
  end
end
