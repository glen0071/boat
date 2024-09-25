class DropMooTasks < ActiveRecord::Migration[7.0]
  def change
    drop_table :moo_tasks
    drop_table :small_wins
    drop_table :wins
  end
end
