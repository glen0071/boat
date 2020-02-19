# frozen_string_literal: true

class Source < ApplicationRecord
  belongs_to :author, optional: true
  has_many :topics, through: :author

  validates :title, presence: true, uniqueness: true
end
