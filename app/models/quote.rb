class Quote < ApplicationRecord
  belongs_to :author, optional: true
  has_many :quote_topics, dependent: :destroy
  has_many :themes, through: :quote_themes

  validates :text, presence: true, uniqueness: true
end
