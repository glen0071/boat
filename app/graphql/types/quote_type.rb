# frozen_string_literal: true

module Types
  class QuoteType < Types::BaseObject
    field :author, Types::AuthorType, null: true
    field :quote_topics, [Types::QuoteTopicType], null: true

    field :id, ID, null: true
    field :text, String, null: true
    field :source, String, null: true
    field :source_link, String, null: true
    field :date, String, null: true
    field :good, Boolean, null: true
    # Change "context" to "comment"
    # field :context, String, null: true
  end
end
