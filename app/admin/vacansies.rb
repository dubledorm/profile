ActiveAdmin.register Vacancy do
  permit_params :name, :min_cost, :max_cost, :currency, :description, :quantity, :actual_state
end
