# frozen_string_literal: true

class ChangeThemeToTopicInTables < ActiveRecord::Migration[5.2]
  def change
    rename_table :themes, :topics
    rename_table :quote_themes, :quote_topics
  end
end
