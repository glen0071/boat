class CreateMooTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :moo_tasks do |t|
      t.string :name
      t.string :status
      t.string :notes

      t.timestamps
    end
  end
end
