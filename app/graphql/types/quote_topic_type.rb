module Types
  class QuoteTopicType < Types::BaseObject
    field :author, Types::AuthorType, null: true

    field :id, ID, null: true
    field :topic_id, ID, null: true
    field :quote_id, ID, null: true
    field :points, Integer, null: true
    field :text, String, null: true
  end
end
