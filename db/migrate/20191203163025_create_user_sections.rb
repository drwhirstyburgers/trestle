class CreateUserSections < ActiveRecord::Migration[6.0]
  def change
    create_table :user_sections do |t|
      t.references :user, null: false, foreign_key: true
      t.references :section, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
