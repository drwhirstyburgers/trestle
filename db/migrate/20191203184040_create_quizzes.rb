class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.references :section, null: false, foreign_key: true
      t.string :title
      t.integer :order_number
      t.integer :time_to_complete
      t.text :description

      t.timestamps
    end
  end
end
