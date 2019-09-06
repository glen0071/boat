class CreateSources < ActiveRecord::Migration[5.2]
  def change
    create_table :sources do |t|
      t.string :name
      t.references :author, foreign_key: true
      t.string :pub_date

      t.timestamps
    end
  end
end
