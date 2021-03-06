# frozen_string_literal: true

class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :author, foreign_key: true
      t.references :topic, foreign_key: true
      t.references :quote, foreign_key: true
    end
  end
end
