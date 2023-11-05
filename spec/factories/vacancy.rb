FactoryBot.define do
  factory :vacancy, class: Vacancy do
    sequence(:name) { |n| "vacancy name #{n}" }
  end
end
