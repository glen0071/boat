# frozen_string_literal: true

class Quote < ApplicationRecord
  include FavoriteModule

  attr_accessor :points
  attr_accessor :favorite

  belongs_to :user, optional: true
  belongs_to :author, optional: true
  belongs_to :source, optional: true
  has_many :quote_topics, dependent: :destroy
  has_many :topics, through: :quote_topics
  has_many :favorites

  attr_writer :new_author, :new_source, :new_topics

  validates :text, presence: true, uniqueness: true

  def decorate_quote(user)
    self.favorite = self.favorites.where(user: user).present?
  end

  def best_title
    return 'Source: Unknown' if source.nil?

    title = source.title
    title += " (#{source.alt_title})" unless source.alt_title.blank?
    title += ", #{page}" unless page.blank?
    title
  end
end
