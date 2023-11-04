# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Email, type: :model do
  describe 'factory' do
    let!(:email) { FactoryBot.create :email }

    # Factories
    it { expect(email).to be_valid }

    # Validations
    it { should validate_presence_of(:email) }

    it { should belong_to(:candidate_profile) }
  end
end
