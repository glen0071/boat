FactoryBot.define do
  factory :holding_case do
    jail_booking { nil }
    case_type { "MyString" }
    mncis_number { "MyString" }
    charged_by { "MyString" }
    clear_reason { "MyString" }
    holding_without_bail { false }
    bail_options { "MyString" }
    next_court_appearance { "2024-09-15 22:56:50" }
  end
end
