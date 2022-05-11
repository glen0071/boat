class AddCategoriesToMooTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :moo_tasks, :category, :string
  end
end
