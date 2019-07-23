FactoryBot.define do
  factory :author do
    name { "John Smith" }
    birth  { "1950" }
    death  { "2000" }
    birth_location  { "Minneapolis, MN, United States" }
  end
end
