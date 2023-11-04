# frozen_string_literal: true

# Телефон кандидата
class Phone < ApplicationRecord
  include ActualRecordConcern

  validates :phone, presence: true

  belongs_to :candidate_profile
end
