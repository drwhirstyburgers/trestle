class CreateCheckpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :checkpoints do |t|
      t.string :name
      t.references :section, null: false, foreign_key: true
      t.integer :order_number
      t.string :description

      t.timestamps
    end
  end
end
