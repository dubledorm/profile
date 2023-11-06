# frozen_string_literal: true

# Описание вакансии
class Vacancy < ApplicationRecord
  include ActualRecordConcern
  CURRENCY_VALUES = %w[rur].freeze
  GRADE_VALUES = %w[junior middle senior].freeze

  validates :name, presence: true
  validates :currency, inclusion: { in: CURRENCY_VALUES }
  validates :grade, inclusion: { in: GRADE_VALUES }
  validates :min_cost, :max_cost, :quantity, numericality: { only_integer: true, greater_than: 0 }

  has_many :candidate_profiles, dependent: :destroy

  after_initialize do
    self.currency = 'rur' if currency.nil?
    self.quantity = 1 if quantity.blank?
    self.grade = 'junior' if grade.nil?
  end
end
