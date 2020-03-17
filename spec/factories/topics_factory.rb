# frozen_string_literal: true

FactoryBot.define do
  factory :topic do
    sequence(:name) { |n| "Truthfulness #{n}" }
    description { 'Foundation of all human virtues...' }
  end
end
