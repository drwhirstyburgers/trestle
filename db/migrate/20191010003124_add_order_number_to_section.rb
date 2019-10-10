class AddOrderNumberToSection < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :order_number, :integer
  end
end
