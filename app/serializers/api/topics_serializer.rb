class Api::TopicsSerializer < ActiveModel::Serializer
  attributes(*Topic.attribute_names.map(&:to_sym))
end
