FactoryBot.define do
  factory :vacancy, class: Vacancy do
    sequence(:name) { |n| "vacancy name #{n}" }
    min_cost { 50_000 }
    max_cost { 100_000 }
    quantity { 1 }
  end
end
