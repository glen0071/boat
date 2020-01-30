# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :quote, QuoteType, null: true do
      description 'Find a quote by ID'
      argument :id, ID, required: true
    end

    def quote(id:)
      Quote.find(id)
    end

    field :quotes, [QuoteType], null: true do
      description 'All quotes'
    end

    def quotes
      Quote.all
    end
  end
end
