class CreateVacancies < ActiveRecord::Migration[7.0]
  def change
    create_table :vacancies do |t|
      t.string :name, null: false
      t.text :description
      t.integer :min_cost
      t.integer :max_cost
      t.string :currency
      t.integer :quantity
      t.string :actual_state

      t.timestamps
    end
  end
end
