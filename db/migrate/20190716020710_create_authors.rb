class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.date :birth
      t.date :death
      t.string :birth_location

      t.timestamps
    end
  end
end
