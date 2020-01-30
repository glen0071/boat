module Types
  class AuthorType < Types::BaseObject
    field :id, ID, null: true
    field :name, String, null: true
    field :birth, String, null: true
    field :death, String, null: true
    field :birth_location, String, null: true
  end
end
