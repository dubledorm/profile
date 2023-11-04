FactoryBot.define do
  factory :email, class: Email do
    sequence(:email) { |n| "#{n}@email.ru" }
    candidate_profile
  end
end
