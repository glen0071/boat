# frozen_string_literal: true

FactoryBot.define do
  factory :quote do
    sequence(:text) { |n| " Truthfulness quote #{n}" }
    source 
    author
    source_link { 'source_link.com' }
    date { '2000 AD' }
    page { 'p. 7' }
  end
end
