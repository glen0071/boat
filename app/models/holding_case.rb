class HoldingCase < ApplicationRecord
  belongs_to :jail_booking
  has_many :case_charges, dependent: :destroy

  before_save :set_bail_options

  scope :where_no_bail_required, lambda {
    where('bail_options LIKE ? OR bail_options LIKE ? OR bail_options LIKE ? OR bail_options LIKE ?',
          '%$0.00 NO BAIL REQUIRED%',
          '%$0.00 RELEASE OWN RECOGNIZANCE%',
          '%$0.00 BAIL/BOND W/O CR%',
          '%$0.00 RELEASE WITH CONDITIONS%')
  }

  BOND_WITHOUT_CONDITIONS_REGEX = %r{(\$\d{0,3},?\d{0,3},?\d{1,3}\.00)\s?(BAIL/BOND W/O CR)}
  CASH_WITHOUT_CONDITIONS_REGEX = %r{(\$\d{0,3},?\d{0,3},?\d{1,3}\.00)\s?(CASH BAIL W/O CR)}
  BOND_WITH_CONDITIONS_REGEX = %r{(\$\d{0,3},?\d{0,3},?\d{1,3}\.00)\s?(BAIL/BOND W/ CR)}
  CASH_WITH_CONDITIONS_REGEX = %r{(\$\d{0,3},?\d{0,3},?\d{1,3}\.00)\s?(CASH BAIL W/ CR)}
  def set_bail_options
    return nil if bail_options.nil?

    self.bond_without_conditions = 0
    self.cash_without_conditions = 0
    self.bond_with_conditions = 0
    self.cash_with_conditions = 0

    if bail_options.match(BOND_WITHOUT_CONDITIONS_REGEX) && bail_options.match(BOND_WITHOUT_CONDITIONS_REGEX)[2].present?
      self.bond_without_conditions = bail_options
                                     .match(BOND_WITHOUT_CONDITIONS_REGEX)[1]
                                     .gsub('$', '').gsub(',', '').to_i
    end

    if bail_options.match(CASH_WITHOUT_CONDITIONS_REGEX) && bail_options.match(CASH_WITHOUT_CONDITIONS_REGEX)[2].present?
      self.cash_without_conditions = bail_options
                                     .match(CASH_WITHOUT_CONDITIONS_REGEX)[1]
                                     .gsub('$', '').gsub(',', '').to_i
    end

    if bail_options.match(BOND_WITH_CONDITIONS_REGEX) && bail_options.match(BOND_WITH_CONDITIONS_REGEX)[2].present?
      self.bond_with_conditions = bail_options.match(BOND_WITH_CONDITIONS_REGEX)[1].gsub('$', '').gsub(',', '').to_i
    end

    if bail_options.match(CASH_WITH_CONDITIONS_REGEX) && bail_options.match(CASH_WITH_CONDITIONS_REGEX)[2].present?
      self.cash_with_conditions = bail_options.match(CASH_WITH_CONDITIONS_REGEX)[1].gsub('$', '').gsub(',', '').to_i
    end

    self.no_bail_required = explicit_nbr? && implicit_nbr?
  end

  def explicit_nbr?
    return nil if bail_options.nil?

    # maybe sufficient to just check for $0.00
    # erring on the side of precision here
    # in case they ever explicate $0.00 for unconditional bail
    bail_options.include?('$0.00 NO BAIL REQUIRED') ||
      bail_options.include?('$0.00 RELEASE OWN RECOGNIZANCE') ||
      bail_options.include?('$0.00 RELEASE WITH CONDITIONS') ||
      bail_options.include?('$0.00 BAIL/BOND W/O CR')
  end

  def bail_amount_with_conditions
    bond_with_conditions.to_i + cash_with_conditions.to_i
  end

  def implicit_nbr?
    bail_amount_with_conditions.zero?
  end
end
