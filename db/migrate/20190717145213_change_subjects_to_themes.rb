class ChangeThemesToThemes < ActiveRecord::Migration[5.2]
  def change
    rename_table :themes, :themes
  end
end
