class CreatePreviews < ActiveRecord::Migration[6.0]
  def change
    create_table :previews do |t|
      t.references :course, null: false, foreign_key: true
      t.string :blurb

      t.timestamps
    end
  end
end
