# frozen_string_literal: true

class SourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :pub_date
  has_one :author
end
