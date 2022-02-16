# frozen_string_literal: true

class Quote < ApplicationRecord
  include FavoriteModule

  attr_accessor :points

  belongs_to :user, optional: true
  belongs_to :author, optional: true
  belongs_to :source, optional: true
  has_many :quote_topics, dependent: :destroy
  has_many :topics, through: :quote_topics
  has_many :favorites

  attr_writer :new_author, :new_source, :new_topics

  validates :text, presence: true, uniqueness: true

  def best_title
    return source_title if source.nil?

    title = source.title
    title += " (#{source.alt_title})" unless source.alt_title.blank?
    title += ", #{page}" unless page.blank?
    title
  end
end
