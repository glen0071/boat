# frozen_string_literal: true

module Types
  class QuoteType < Types::BaseObject
    field :author, Types::AuthorType, null: true
    field :quote_topics, [Types::QuoteTopicType], null: true

    field :id, ID, null: true
    field :text, String, null: true
    field :source_title, String, null: true
    field :best_title, String, null: true
    field :source_link, String, null: true
    field :date, String, null: true
    field :page, String, null: true
    field :good, Boolean, null: true
  end
end
