# frozen_string_literal: true

# Декоратор для Vacancy
class VacancyDecorator < Draper::Decorator
  delegate_all

  DEFAULT_STATE_VALUE = 'undefined'
  DEFAULT_CURRENCY_VALUE = 'undefined'
  DEFAULT_GRADE_VALUE = 'undefined'

  def actual_state
    I18n.t("vacancy.actual_state.#{object.actual_state || DEFAULT_STATE_VALUE}")
  end

  def self.actual_states
    ActualRecordConcern::ACTUAL_STATE_VALUES.map do |state_value|
      [I18n.t("vacancy.actual_state.#{state_value}"), state_value]
    end
  end

  def grade
    I18n.t("vacancy.grade.#{object.grade || DEFAULT_GRADE_VALUE}")
  end

  def self.grades
    Vacancy::GRADE_VALUES.map do |grade|
      [I18n.t("vacancy.grade.#{grade}"), grade]
    end
  end

  def currency
    I18n.t("vacancy.currency.#{object.currency || DEFAULT_CURRENCY_VALUE}")
  end

  def self.currencies
    Vacancy::CURRENCY_VALUES.map do |currency|
      [I18n.t("vacancy.currency.#{currency}"), currency]
    end
  end
end
