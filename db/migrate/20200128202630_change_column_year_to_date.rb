# frozen_string_literal: true

class ChangeColumnYearToDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :quotes, :year, :date
  end
end
