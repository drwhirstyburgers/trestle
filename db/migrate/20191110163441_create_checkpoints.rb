class CreateCheckpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :checkpoints do |t|
      t.references :section, null: false, foreign_key: true
      t.integer :order_number
      t.text :description
      t.integer :time_to_complete
      t.string :title

      t.timestamps
    end
  end
end
