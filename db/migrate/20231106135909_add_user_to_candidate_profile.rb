class AddUserToCandidateProfile < ActiveRecord::Migration[7.0]
  def change
    CandidateProfile.destroy_all
    add_reference :candidate_profiles, :user, null: false, foreign_key: true
  end
end
