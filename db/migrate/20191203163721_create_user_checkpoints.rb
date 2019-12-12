class CreateUserCheckpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :user_checkpoints do |t|
      t.references :user, null: false, foreign_key: true
      t.references :checkpoint, null: false, foreign_key: true
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
