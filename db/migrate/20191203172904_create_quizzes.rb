class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.string :title
      t.text :description
      t.integer :order_number
      t.integer :time_to_complete
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
