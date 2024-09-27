class JailBooking < ApplicationRecord
  has_many :holding_cases, dependent: :destroy
  has_many :case_charges, through: :holding_cases

  def days_in
    start_time = received_date_time&.to_datetime
    return nil if start_time.nil?

    end_time = released_date_time&.to_datetime || DateTime.now
    (end_time - start_time).to_i
  end

  # def money_holding
  #   holding_cases.each do |holding_case|
  #     # what to return for HWB?
  #     next if holding_case.bail_options.nil?

  #     prices = holding_case.bail_options.scan(/\$\d{1,3}(?:,\d{3})*(?:\.\d{2})?/)
  #     prices.include?('$0.00')
  #     prices.include?
  #   end
  # end
end
