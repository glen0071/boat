module Types
  class QuoteTopicType < Types::BaseObject
    field :id, ID, null: true
    field :topic_id, ID, null: true
    field :quote_id, ID, null: true
    field :points, Integer, null: true
  end
end
