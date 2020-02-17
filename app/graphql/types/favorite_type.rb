# frozen_string_literal: true

module Types
  class FavoriteType < Types::BaseObject
    field :author, Types::AuthorType, null: true
    field :quote, Types::QuoteType, null: true
    field :topic, Types::TopicType, null: true

    field :id, ID, null: true
  end
end
