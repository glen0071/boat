# frozen_string_literal: true

class Api::QuoteSerializer < ActiveModel::Serializer
  attributes(*Quote.attribute_names.map(&:to_sym))
end
