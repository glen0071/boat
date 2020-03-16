class AddLockToQuotesTopicsAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :locked, :boolean, default: false
    add_column :quotes, :locked, :boolean, default: false
    add_column :topics, :locked, :boolean, default: false
  end
end
