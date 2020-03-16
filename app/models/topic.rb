# frozen_string_literal: true

class Topic < ApplicationRecord
  include FavoriteModule

  belongs_to :user, optional: true
  has_many :quote_topics, dependent: :destroy
  has_many :quotes, through: :quote_topics
  has_many :authors, through: :quotes

  validates :name, presence: true, uniqueness: true

  def ranked_quotes
    quotes
      .includes(:quote_topics)
      .where('quote_topics.topic_id = ?', id)
      .references(:quote_topics)
      .sort do |a, b|
        b.quote_topics.first.points <=> a.quote_topics.first.points
      end
  end
end
