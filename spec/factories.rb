FactoryGirl.define do
  factory :organization do
    sequence(:name)      { |n| "company #{n}" }
    sequence(:subdomain) { |n| "company#{n}" }
  end
end
