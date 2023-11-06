# frozen_string_literal: true

# Декоратор для CandidateProfile
class CandidateProfileDecorator < Draper::Decorator
  delegate_all

  DEFAULT_STATE_VALUE = 'undefined'

  def state
    I18n.t("candidate_profile.state.#{object.state || DEFAULT_STATE_VALUE}")
  end

  def self.states
    CandidateProfileStateConcern::STATE_VALUES.map do |state_value|
      [I18n.t("candidate_profile.state.#{state_value}"), state_value]
    end
  end
end
