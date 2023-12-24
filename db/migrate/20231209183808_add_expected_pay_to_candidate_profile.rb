class AddExpectedPayToCandidateProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :candidate_profiles, :expected_pay, :integer
  end
end
