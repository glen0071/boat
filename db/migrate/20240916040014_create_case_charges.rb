class CreateCaseCharges < ActiveRecord::Migration[7.0]
  def change
    create_table :case_charges do |t|
      t.references :holding_case, null: false, foreign_key: true
      t.integer :charge_number
      t.string :description
      t.string :severity_of_charge
      t.string :statute
      t.string :charge_status

      t.timestamps
    end
  end
end
