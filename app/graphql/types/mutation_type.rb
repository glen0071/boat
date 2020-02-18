# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :vote_quote_topic,    mutation: Mutations::VoteQuoteTopic
    field :favorite_instance,   mutation: Mutations::FavoriteInstance
    field :unfavorite_instance, mutation: Mutations::UnfavoriteInstance
  end
end
