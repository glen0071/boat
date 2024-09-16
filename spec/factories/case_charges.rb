FactoryBot.define do
  factory :case_charge do
    holding_case { nil }
    charge_number { 1 }
    description { "MyString" }
    severity_of_charge { "MyString" }
    statute { "MyString" }
    charge_status { "MyString" }
  end
end
