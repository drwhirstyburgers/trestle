class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.references :course, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.integer :time_to_complete

      t.timestamps
    end
  end
end
