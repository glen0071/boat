class AddBailDetailsHoldingCases < ActiveRecord::Migration[7.0]
  def change
    add_column :holding_cases, :no_bail_required, :boolean
    add_column :holding_cases, :bond_without_conditions, :integer
    add_column :holding_cases, :cash_without_conditions, :integer
    add_column :holding_cases, :bond_with_conditions, :integer
    add_column :holding_cases, :cash_with_conditions, :integer
  end
end
