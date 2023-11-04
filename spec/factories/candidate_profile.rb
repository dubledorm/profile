FactoryBot.define do
  factory :candidate_profile, class: CandidateProfile do
    sequence(:lastname) { |n| "lastname #{n}" }
  end
end
