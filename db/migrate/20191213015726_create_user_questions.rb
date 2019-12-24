class CreateUserQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_questions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :quiz, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.integer :choice
      t.integer :correct_choice

      t.timestamps
    end
  end
end
