# frozen_string_literal: true

class Author < ApplicationRecord
  include FavoriteModule

  belongs_to :user, optional: true
  has_many :quotes, dependent: :destroy
  has_many :quote_topics, through: :quotes
  has_many :topics, through: :quote_topics
  has_many :sources

  validates :name, presence: true, uniqueness: true
end
