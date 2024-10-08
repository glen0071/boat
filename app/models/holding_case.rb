class HoldingCase < ApplicationRecord
  belongs_to :jail_booking
  has_many :case_charges, dependent: :destroy

  # Bail Cateogirization
  # - NBR
  # - Must Pay
  # - Must Pay: 78
  # - Must Pay: $1,000+
  # - Must Pay: $10,000+
  # - Must Pay: $100,000+
  #

  # More categories
  # Before vs. after first appearance
end
