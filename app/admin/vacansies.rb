ActiveAdmin.register Vacancy do
  permit_params :name, :min_cost, :max_cost, :currency, :description, :quantity, :actual_state

  decorate_with VacancyDecorator

  filter :name
  filter :actual_state, as: :select, collection: proc { VacancyDecorator.actual_states }


  form title: Vacancy.model_name.human do |f|
    f.semantic_errors *f.object.errors
    inputs do
      f.input :name
      f.input :description
      f.input :min_cost
      f.input :max_cost
      f.input :currency, as: :select, collection: VacancyDecorator.currencies
      f.input :quantity
      f.input :actual_state, as: :select, collection: VacancyDecorator.actual_states
    end
    f.actions
  end
end
