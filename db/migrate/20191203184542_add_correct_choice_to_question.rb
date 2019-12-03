class AddCorrectChoiceToQuestion < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :correct_choice, :integer
  end
end
