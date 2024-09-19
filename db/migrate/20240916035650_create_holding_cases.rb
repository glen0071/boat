class CreateHoldingCases < ActiveRecord::Migration[7.0]
  def change
    create_table :holding_cases do |t|
      t.references :jail_booking, null: false, foreign_key: true
      t.string :case_type
      t.string :mncis_number
      t.string :charged_by
      t.string :clear_reason
      t.boolean :holding_without_bail
      t.string :bail_options
      t.datetime :next_court_appearance

      t.timestamps
    end
  end
end
