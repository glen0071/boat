class Quote < ApplicationRecord
  has_one :author
  has_many :quote_themes
  has_many :themes, through: :quote_themes
end
