class QuoteTheme < ApplicationRecord
  belongs_to :theme
  belongs_to :quote

  validates :quote_id, uniqueness: { scope: :theme_id }
end
