# frozen_string_literal: true

module Mutations
  class VoteQuoteTopic < BaseMutation
    field :quote_topic, Types::QuoteTopicType, null: false
    field :errors, [String], null: false

    argument :quote_topic_id, ID, required: true
    argument :change, Integer, required: true

    def resolve(quote_topic_id:, change:)
      qt = QuoteTopic.find(quote_topic_id)
      qt.points += change
      if qt.save
        {
          quote_topic: qt,
          error: []
        }
      else
        {
          quote_topic: qt,
          error: qt.errors.full_messages
        }
      end
    end
  end
end
