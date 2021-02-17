FactoryBot.define do
  factory :author do
    sequence(:first_name) { |i| "Author #{i}" }
    last_name { "Dummy" }
  end
end