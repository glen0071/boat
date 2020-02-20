# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'mail@mail.com' }
    password { 'password' }
  end
end
