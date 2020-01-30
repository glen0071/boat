# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    sequence(:name) { |n| " Smith Nate #{n}" }
    birth  { '1950' }
    death  { '2000' }
    birth_location  { 'Minneapolis, MN, United States' }
  end
end
