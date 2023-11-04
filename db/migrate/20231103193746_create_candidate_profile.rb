class CreateCandidateProfile < ActiveRecord::Migration[7.0]
  def change
    create_table :candidate_profiles do |t|
      t.string :lastname, null: false
      t.string :firstname
      t.string :patronymic
      t.date :birthday
      t.text :description

      t.timestamps
    end

    add_index :candidate_profiles, :birthday
    add_index :candidate_profiles, :lastname
  end
end
