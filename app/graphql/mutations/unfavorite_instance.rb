# frozen_string_literal: true

module Mutations
  class UnfavoriteInstance < BaseMutation
    # returns
    field :errors, [String], null: false
    field :messages, [String], null: false

    # expects parameters
    argument :klass, String,    required: true
    argument :id, ID,           required: true
    argument :user_id, ID,      required: true
    argument :favorite_id, ID,  required: true

    def resolve(klass:, id:, user_id:, favorite_id:)
      favorite = Favorite.find(favorite_id)
      favorite.destroy if favorite.user_id == user_id && favorite.klass == klass
      if favorite.persisted?
        {
          errors: ['unable to destroy instance'],
          messages: []
        }
      else
        {
          errors: [],
          messages: ['destroyed successfully']
        }
      end

      {
        errors: [],
        messages: ['destroyed successfully']
      }
    end
  end
end
