# frozen_string_literal: true

class Source < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :author, optional: true
  has_many :topics, through: :author
  has_many :quotes

  validates :title, presence: true, uniqueness: true
  validates :alt_title, presence: true, uniqueness: true, allow_nil: true

  def combined_titles
    "#{title}, (#{alt_title})"
  end
end
