# frozen_string_literal: true

class Quote < ApplicationRecord
  include FavoriteModule

  belongs_to :author, optional: true
  belongs_to :source, optional: true
  has_many :quote_topics, dependent: :destroy
  has_many :topics, through: :quote_topics
  has_many :favorites

  validates :text, presence: true, uniqueness: true

  def best_title
    return source_title if source&.title.blank? && source&.alt_title.blank?
    if source&.title.blank?
      source&.alt_title
    elsif source&.alt_title.blank?
      source&.title
    else
      "#{source&.title} (#{source&.alt_title})".strip
    end
  end
end
