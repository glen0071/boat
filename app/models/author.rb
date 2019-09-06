class Author < ApplicationRecord
  has_many :quotes, dependent: :destroy
  has_many :sources

  validates :name, presence: true, uniqueness: true
end
