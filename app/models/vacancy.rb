# frozen_string_literal: true

# Описание вакансии
class Vacancy < ApplicationRecord
  include ActualRecordConcern

  validates :name, presence: true

  has_many :candidate_profiles, dependent: :destroy
end
