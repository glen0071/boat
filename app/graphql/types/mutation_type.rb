# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :vote_quote_topic, mutation: Mutations::VoteQuoteTopic
  end
end
