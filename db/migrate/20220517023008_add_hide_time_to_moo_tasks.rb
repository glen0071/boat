class AddHideTimeToMooTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :moo_tasks, :hide_time, :timestamp
  end
end
