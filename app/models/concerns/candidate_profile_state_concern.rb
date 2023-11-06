# frozen_string_literal: true

# StateMachine для CandidateProfile
module CandidateProfileStateConcern
  extend ActiveSupport::Concern
  STATE_VALUES = %w[new].freeze

  included do
    validates :state, inclusion: { in: STATE_VALUES }

    after_initialize do
      self.state = 'new' if state.nil?
    end
  end
end
