# frozen_string_literal: true

json.extract! topic, :id, :name, :description, :created_at, :updated_at
json.url topic_url(topic, format: :json)
