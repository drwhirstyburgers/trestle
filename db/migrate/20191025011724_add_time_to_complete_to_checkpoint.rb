class AddTimeToCompleteToCheckpoint < ActiveRecord::Migration[6.0]
  def change
    add_column :checkpoints, :time_to_complete, :integer
  end
end
