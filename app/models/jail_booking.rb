class JailBooking < ApplicationRecord
  has_many :holding_cases, dependent: :destroy
end
