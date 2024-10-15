class JailBooking < ApplicationRecord
  has_many :holding_cases, dependent: :destroy
  has_many :case_charges, through: :holding_cases

  def days_in
    start_time = received_date_time&.to_datetime
    return nil if start_time.nil?

    end_time = released_date_time&.to_datetime || DateTime.now
    (end_time - start_time).to_i
  end

  def bail_required_on_booking
    return nil if holding_cases.nil?

    bail_decisions = holding_cases.map do |holding_case|
      holding_case.set_bail_options if holding_case.no_bail_required.nil?

      holding_case.no_bail_required
    end

    bail_decisions.include?(true)
  end

  def bail_amount
    return 0 unless bail_required_on_booking

    holding_cases.map(&:bail_amount_with_conditions).sum
  end
end
