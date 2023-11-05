# frozen_string_literal: true

# Кандидат на вакансию
class CandidateProfile < ApplicationRecord
  validates :lastname, presence: true

  belongs_to :vacancy
  has_many :emails, dependent: :destroy
  accepts_nested_attributes_for :emails, allow_destroy: true
  has_many :phones, dependent: :destroy
  accepts_nested_attributes_for :phones, allow_destroy: true

  has_one_attached :resume # Файл с резюме
end
