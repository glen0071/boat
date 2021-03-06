# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    ##########
    # Quotes #
    ##########
    field :quotes, [QuoteType], null: true do
      description 'All quotes'
    end

    def quotes
      Quote.all.shuffle
    end

    field :quote, QuoteType, null: true do
      description 'Find a quote by ID'
      argument :id, ID, required: true
    end

    def quote(id:)
      Quote.find(id)
    end

    field :favorite, FavoriteType, null: true do
      argument :klass, String, required: true
      argument :id, ID, required: true
      argument :user_id, ID, required: true
    end

    def favorite(klass:, user_id:, id:)
      klass.constantize.find(id).favorites.where(user_id: user_id).first
    end

    ##########
    # Topics #
    ##########
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

    ##########
    # QuoteTopics #
    ##########
    field :quote_topics, [QuoteTopicType], null: true do
      description 'All quote_topics'
    end

    def quote_topics
      QuoteTopic.all
    end

    field :quote_topic, QuoteTopicType, null: true do
      description 'Find a quote_topic by ID'
      argument :id, ID, required: true
    end

    def quote_topic(id:)
      QuoteTopic.find(id)
    end
  end
end
