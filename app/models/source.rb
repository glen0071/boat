# frozen_string_literal: true

class Source < ApplicationRecord
  belongs_to :author, optional: true

  validates :name, presence: true, uniqueness: true
end
