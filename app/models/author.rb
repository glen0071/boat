class Author < ApplicationRecord
  has_many :quotes, dependent: :destroy
  has_many :quote_topics, through: :quotes
  has_many :topics, through: :quote_topics
  has_many :sources

  validates :name, presence: true, uniqueness: true
end
