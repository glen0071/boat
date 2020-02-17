# frozen_string_literal: true

class Quote < ApplicationRecord
  include FavoriteModule
  
  belongs_to :author, optional: true
  has_many :quote_topics, dependent: :destroy
  has_many :topics, through: :quote_topics
  has_many :favorites

  validates :text, presence: true, uniqueness: true

end
