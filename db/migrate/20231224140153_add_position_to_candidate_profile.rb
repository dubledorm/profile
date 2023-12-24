class AddPositionToCandidateProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :candidate_profiles, :position, :string
  end
end
