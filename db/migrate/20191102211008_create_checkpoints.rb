class CreateCheckpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :checkpoints do |t|
      t.string :title
      t.references :section, null: false, foreign_key: true
      t.string :description
      t.integer :time_to_complete

      t.timestamps
    end
  end
end
