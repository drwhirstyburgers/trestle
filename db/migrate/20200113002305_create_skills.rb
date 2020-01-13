class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.references :preview, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
