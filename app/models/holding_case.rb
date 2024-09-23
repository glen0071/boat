class HoldingCase < ApplicationRecord
  belongs_to :jail_booking
  has_many :case_charges, dependent: :destroy
end
