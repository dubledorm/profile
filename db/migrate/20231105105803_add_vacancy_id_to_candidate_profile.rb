class AddVacancyIdToCandidateProfile < ActiveRecord::Migration[7.0]
  def change
    CandidateProfile.destroy_all
    add_reference :candidate_profiles, :vacancy, null: false, foreign_key: true
  end
end
