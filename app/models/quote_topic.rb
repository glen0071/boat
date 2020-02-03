# frozen_string_literal: true

class QuoteTopic < ApplicationRecord
  belongs_to :topic
  belongs_to :quote

  validates :quote_id, uniqueness: { scope: :topic_id }

  delegate :text, to: :quote
  delegate :author, to: :quote
end
