class AddArchiveToCourse < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :archive, :boolean, default: false
  end
end
