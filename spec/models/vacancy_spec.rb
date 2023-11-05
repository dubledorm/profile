# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Vacancy, type: :model do
  describe 'factory' do
    let!(:vacancy) { FactoryBot.create :vacancy }

    # Factories
    it { expect(vacancy).to be_valid }

    # Validations
    it { should validate_presence_of(:name) }
  end
end
