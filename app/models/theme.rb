class Theme < ApplicationRecord
  has_many :quote_themes
  has_many :quotes, through: :quote_themes
end
