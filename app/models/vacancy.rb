# frozen_string_literal: true

# Описание вакансии
class Vacancy < ApplicationRecord
  include ActualRecordConcern

  validates :name, presence: true
end
