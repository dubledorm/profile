# frozen_string_literal: true

# Email кандидата
class Email < ApplicationRecord
  include ActualRecordConcern

  validates :email, presence: true

  belongs_to :candidate_profile
end
