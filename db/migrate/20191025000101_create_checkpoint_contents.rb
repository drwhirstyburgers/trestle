class CreateCheckpointContents < ActiveRecord::Migration[6.0]
  def change
    create_table :checkpoint_contents do |t|
      t.integer :type
      t.string :text
      t.string :video_url
      t.integer :order
      t.references :checkpoint, null: false, foreign_key: true

      t.timestamps
    end
  end
end
