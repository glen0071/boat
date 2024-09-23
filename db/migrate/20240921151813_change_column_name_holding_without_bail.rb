class ChangeColumnNameHoldingWithoutBail < ActiveRecord::Migration[7.0]
  def change
    rename_column :holding_cases, :holding_without_bail, :hold_without_bail
  end
end
