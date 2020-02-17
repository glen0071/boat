# frozen_string_literal: true

class Source < ApplicationRecord
  belongs_to :author, optional: true

  validates :title, presence: true, uniqueness: true
end
