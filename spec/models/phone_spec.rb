# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Phone, type: :model do
  describe 'factory' do
    let!(:phone) { FactoryBot.create :phone }

    # Factories
    it { expect(phone).to be_valid }

    # Validations
    it { should validate_presence_of(:phone) }

    it { should belong_to(:candidate_profile) }
  end
end
