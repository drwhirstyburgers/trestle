class CreateLandingPages < ActiveRecord::Migration[6.0]
  def change
    create_table :landing_pages do |t|

      t.timestamps
    end
  end
end
