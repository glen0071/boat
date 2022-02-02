class MooTaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :notes
end
