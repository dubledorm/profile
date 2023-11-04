class CreateEmail < ActiveRecord::Migration[7.0]
  def change
    create_table :emails do |t|
      t.string :email
      t.string :description
      t.string :actual_state
      t.references :candidate_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
