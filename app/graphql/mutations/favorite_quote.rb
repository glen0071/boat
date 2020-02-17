# frozen_string_literal: true

module Mutations
  class FavoriteQuote < BaseMutation
    argument :klass, String, null: false
    argument :id, ID, null: false
    argument :user_id, ID, null: false

    argument :quote_topic_id, ID, required: true
    argument :change, Integer, required: true

    def resolve(klass:, id:, user_id:)
      instance = klass.constantize.find(id)
      fave = instance.favorites.new(user_id: user_id)
      if fave.save
        {
          fave: fave,
          error: []
        }
      else
        {
          fave: fave,
          error: fave.errors.full_messages
        }
      end
    end
  end
end
