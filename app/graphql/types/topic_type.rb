module Types
  class TopicType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :description, String, null: true
    field :quotes, [Types::QuoteType], null: true
  end
end
