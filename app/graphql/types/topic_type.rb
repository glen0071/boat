module Types
  class TopicType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :description, String, null: true
    field :quotes, [Types::QuoteType], null: true
    field :quote_topics, [Types::QuoteTopicType], null: true
  end
end
