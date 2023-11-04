FactoryBot.define do
  factory :phone, class: Phone do
    sequence(:phone) { |n| "#{n}" }
    candidate_profile
  end
end
