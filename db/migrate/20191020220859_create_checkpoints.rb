class CreateCheckpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :checkpoints do |t|
      t.string :name
      t.string :content
      t.references :section, null: false, foreign_key: true
      t.string :video_url
      t.integer :order_number

      t.timestamps
    end
  end
end
