# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CandidateProfile, type: :model do
  describe 'factory' do
    let!(:candidate_profile) { FactoryBot.create :candidate_profile }

    # Factories
    it { expect(candidate_profile).to be_valid }

    # Validations
    it { should validate_presence_of(:lastname) }
    it { should belong_to(:user) }
  end

  describe 'validates' do
    it { expect(described_class.new(lastname: 'lastname', user: FactoryBot.create(:user)).valid?).to be_truthy }
  end
end
