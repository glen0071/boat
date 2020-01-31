# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Quotes
    ########
    field :quotes, [QuoteType], null: true do
      description 'All quotes'
    end

    def quotes
      Quote.all
    end

    field :quote, QuoteType, null: true do
      description 'Find a quote by ID'
      argument :id, ID, required: true
    end

    def quote(id:)
      Quote.find(id)
    end

    # Topics
    ########
    field :topics, [TopicType], null: true do
      description 'All topics'
    end

    def topics
      Topic.all
    end

    field :topic, TopicType, null: true do
      description 'Find a topic by ID'
      argument :id, ID, required: true
    end

    def topic(id:)
      Topic.find(id)
    end
  end
end
