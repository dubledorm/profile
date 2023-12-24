# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CandidateProfileBuilder do
  let(:html_string) { File.open('spec/fixtures/cv_example.html', 'r', &:read) }
  let(:builder) { described_class.new(html_string) }

  describe 'build' do
    it { expect(builder.build.lastname).to eq('Рубцов') }
    it { expect(builder.build.firstname).to eq('Михаил') }
    it { expect(builder.build.patronymic).to eq('Вячеславович') }
    it { expect(builder.build.birthday).to eq(Date.new(1988, 5, 26)) }
    it { expect(builder.build.expected_pay).to eq(200_000) }
    it { expect(builder.build.position).to eq('Инженер-программист') }
  end

  describe 'html' do
    it 'should return html without salary' do
      # File.open('spec/fixtures/cv_result.html', 'w') do |f|
      #   f.write(builder.safe_html)
      # end
      expect(builder.safe_html).to eq(File.read('spec/fixtures/cv_result.html'))
    end
  end
end
