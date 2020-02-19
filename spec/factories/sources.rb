# frozen_string_literal: true

FactoryBot.define do
  factory :source do
    title { 'Primero Tableta' }
    alt_title { 'First Tablet' }
    association :author
    pub_date { 'May 22, 1844' }
  end
end
