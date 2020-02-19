# frozen_string_literal: true

FactoryBot.define do
  factory :quote do
    text { 'Truthfulness' }
    association :source
    source_link { 'source_link.com' }
    date { '2000 AD' }
  end
end
