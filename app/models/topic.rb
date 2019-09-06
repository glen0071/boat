class Topic < ApplicationRecord
  has_many :quote_topics, dependent: :destroy
  has_many :quotes, through: :quote_topics
  has_many :authors, through: :quotes

  validates :name, presence: true, uniqueness: true
end
