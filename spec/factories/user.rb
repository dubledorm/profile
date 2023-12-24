FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
