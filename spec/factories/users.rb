# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "mail_#{n}@mail.com" }
    password { 'password' }
  end
end
