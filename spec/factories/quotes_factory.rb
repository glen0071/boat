# frozen_string_literal: true

FactoryBot.define do
  factory :quote do
    text { 'Truthfulness' }
    association :source
    source_link { 'source_link.com' }
    source_title { 'Source Title' }
    date { '2000 AD' }
    page { 'p. 7'}
  end
end
