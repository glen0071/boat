class AddYearToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :year, :string
  end
end
