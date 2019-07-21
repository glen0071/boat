class Theme < ApplicationRecord
  has_many :quote_themes
  has_many :quotes, through: :quote_themes

  validates :name, presence: true, uniqueness: true
end
