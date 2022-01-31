# frozen_string_literal: true

class Source < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :author, optional: true
  has_many :topics, through: :author
  has_many :quotes

  validates :title, presence: true, uniqueness: true

  def combined_titles
    if title.present? && alt_title.present?
      "#{title}, (#{alt_title})"
    elsif title.present?
      title
    elsif
      alt_title
    end
  end
end
