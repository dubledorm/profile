class AddEmailAndPhoneToCandidateProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :candidate_profiles, :email, :string
    add_column :candidate_profiles, :phone, :string

    add_index :candidate_profiles, :email
    add_index :candidate_profiles, :phone
  end
end
