class TopicThemesTopicForeignKey < ActiveRecord::Migration[5.2]
  def change
    rename_column :quote_topics, :theme_id, :topic_id
  end
end
