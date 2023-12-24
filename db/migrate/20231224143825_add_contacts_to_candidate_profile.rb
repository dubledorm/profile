class AddContactsToCandidateProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :candidate_profiles, :contacts, :string
  end
end
