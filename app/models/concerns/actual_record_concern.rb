# frozen_string_literal: true

# Для работы с актуальными и устаревшими записями
module ActualRecordConcern
  extend ActiveSupport::Concern
  ACTUAL_STATE_VALUES = %w[actual deprecated].freeze

  included do
    validates :actual_state, inclusion: { in: ACTUAL_STATE_VALUES }

    before_validation do
      self.actual_state = 'actual' if actual_state.nil?
    end
  end
end
