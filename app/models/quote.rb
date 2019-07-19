class Quote < ApplicationRecord
  belongs_to :author, optional: true
  has_many :quote_themes
  has_many :themes, through: :quote_themes
end
