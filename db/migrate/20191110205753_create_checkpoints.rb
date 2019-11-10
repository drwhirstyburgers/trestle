class CreateCheckpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :checkpoints do |t|
      t.references :section, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :order_number
      t.integer :time_to_complete

      t.timestamps
    end
  end
end
