class ChangeSubjectsToThemes < ActiveRecord::Migration[5.2]
  def change
    rename_table :subjects, :themes
  end
end
