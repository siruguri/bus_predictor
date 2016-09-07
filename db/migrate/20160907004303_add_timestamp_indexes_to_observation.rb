class AddTimestampIndexesToObservation < ActiveRecord::Migration[5.0]
  def change
    add_index :observations, :observed_at
    add_index :observations, :arrives_at
  end
end
