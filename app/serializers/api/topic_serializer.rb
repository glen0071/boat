# frozen_string_literal: true

class Api::TopicSerializer < ActiveModel::Serializer
  attributes(*Topic.attribute_names.map(&:to_sym))
end
