# frozen_string_literal: true

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :author, optional: true
  belongs_to :quote, optional: true
  belongs_to :topic, optional: true
end
