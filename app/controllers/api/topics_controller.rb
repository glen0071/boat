# frozen_string_literal: true

class Api::TopicsController < ApplicationController
  respond_to :json

  def index
    respond_with Topic.all, each_serializer: Api::TopicSerializer
  end
end
