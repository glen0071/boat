class Api::TopicsController < Api::BaseController
  def index
    topics = Topic.all

    render jsonapi: topics, serializer: Api::TopicsSerializer
  end
end
