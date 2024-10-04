class DropMooTasks < ActiveRecord::Migration[7.0]
  def change
    drop_table :moo_tasks
  end
end
