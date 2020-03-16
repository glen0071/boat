# frozen_string_literal: true

FactoryBot.define do
  factory :source do
    sequence(:title) { |n| "Primero Tableta #{n}" }
    sequence(:alt_title) { |n| "First Tablet #{n}" }
    association :author
    pub_date { 'May 22, 1844' }
  end
end
