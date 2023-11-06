class AddStateToCandidateProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :candidate_profiles, :state, :string
    add_column :candidate_profiles, :control_date, :date

    add_index :candidate_profiles, :state
    add_index :candidate_profiles, :control_date
  end
end
