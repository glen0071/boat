# frozen_string_literal: true

class AddAboutToAuthors < ActiveRecord::Migration[6.0]
  def change
    add_column :authors, :about, :text
  end
end
