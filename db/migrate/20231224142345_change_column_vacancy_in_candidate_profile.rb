class ChangeColumnVacancyInCandidateProfile < ActiveRecord::Migration[7.0]
  def change
    change_column :candidate_profiles, :vacancy_id, :bigint, null: true
  end
end
