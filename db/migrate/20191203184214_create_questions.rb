class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.references :quiz, null: false, foreign_key: true
      t.string :question
      t.integer :order_number
      t.string :video_url

      t.timestamps
    end
  end
end
