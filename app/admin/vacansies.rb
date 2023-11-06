ActiveAdmin.register Vacancy do
  permit_params :name, :min_cost, :max_cost, :currency, :description, :quantity, :actual_state, :grade

  decorate_with VacancyDecorator

  filter :name
  filter :actual_state, as: :select, collection: proc { VacancyDecorator.actual_states }
  filter :grade, as: :select, collection: proc { VacancyDecorator.grades }

  index do
    id_column
    column :name
    column :grade
    column :actual_state
    column :quantity
    column :min_cost
    column :max_cost
    column :currency
    column :created_at
    column :updated_at
    actions
  end


  form title: Vacancy.model_name.human do |f|
    f.semantic_errors *f.object.errors
    inputs do
      f.input :name
      f.input :description
      f.input :min_cost
      f.input :max_cost
      f.input :currency, as: :select, collection: VacancyDecorator.currencies
      f.input :grade, as: :select, collection: VacancyDecorator.grades
      f.input :quantity
      f.input :actual_state, as: :select, collection: VacancyDecorator.actual_states
    end
    f.actions
  end
end
