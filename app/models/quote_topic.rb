class QuoteTopic < ApplicationRecord
  belongs_to :topic
  belongs_to :quote

  validates :quote_id, uniqueness: { scope: :topic_id }
end
