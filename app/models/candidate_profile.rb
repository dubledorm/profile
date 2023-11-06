# frozen_string_literal: true

# Кандидат на вакансию
class CandidateProfile < ApplicationRecord
  include CandidateProfileStateConcern

  validates :lastname, presence: true
  validates :email, format: { with: /\A[\w\-\.]+@([\w\-]+\.)+[\w\-]{2,4}\Z/ },
                    allow_nil: true, allow_blank: true
  validates :phone, format: { with: /\A(\+)?(\d{1,2})?[( .-]*(\d{3})[) .-]*(\d{3,4})[ .-]?(\d{4})\Z/ },
                    allow_nil: true, allow_blank: true

  belongs_to :vacancy
  # has_many :emails, dependent: :destroy
  # accepts_nested_attributes_for :emails, allow_destroy: true
  # has_many :phones, dependent: :destroy
  # accepts_nested_attributes_for :phones, allow_destroy: true

  has_one_attached :resume # Файл с резюме
end
