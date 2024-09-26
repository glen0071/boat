class JailBooking < ApplicationRecord
  has_many :holding_cases, dependent: :destroy
  has_many :case_charges, through: :holding_cases
end
