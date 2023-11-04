class CreatePhone < ActiveRecord::Migration[7.0]
  def change
    create_table :phones do |t|
      t.string :phone, null: false
      t.text :description
      t.string :actual_state
      t.references :candidate_profile, null: false, foreign_key: true

      t.timestamps
    end

    add_index :phones, :phone
  end
end
