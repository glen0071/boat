class BlogPostSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :url
end
