class Topic < ApplicationRecord
  has_many :quote_topics, dependent: :destroy
  has_many :quotes, through: :quote_topics

  validates :name, presence: true, uniqueness: true
end
