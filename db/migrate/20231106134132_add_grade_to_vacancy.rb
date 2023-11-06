class AddGradeToVacancy < ActiveRecord::Migration[7.0]
  def change
    add_column :vacancies, :grade, :string
  end
end
