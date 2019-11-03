class AddOrderNumberToCheckpoint < ActiveRecord::Migration[6.0]
  def change
    add_column :checkpoints, :order_number, :integer
  end
end
