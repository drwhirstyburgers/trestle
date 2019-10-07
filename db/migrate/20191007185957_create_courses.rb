class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :description
      t.float :price
      t.integer :duration
      t.string :accreditation

      t.timestamps
    end
  end
end
