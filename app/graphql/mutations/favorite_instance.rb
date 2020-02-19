# frozen_string_literal: true

module Mutations
  class FavoriteInstance < BaseMutation
    # returns
    field :favorite, Types::FavoriteType, null: false
    field :errors, [String], null: false

    # expects parameters
    argument :klass, String, required: true
    argument :id, ID, required: true
    argument :user_id, ID, required: true

    def resolve(klass:, id:, user_id:)
      instance = klass.constantize.find(id)
      fave = instance.favorites.new(user_id: user_id, klass: klass)
      if fave.save
        {
          favorite: fave,
          error: []
        }
      else
        {
          favorite: fave,
          error: fave.errors.full_messages
        }
      end
    end
  end
end
