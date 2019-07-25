FactoryBot.define do
  factory :quote do
    text { "Truthfulness" }
    source { "Source" }
    source_link { "source_link.com" }
    year { "2000 AD" }
  end
end
