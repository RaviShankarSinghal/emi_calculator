# frozen_string_literal: true
require 'spec_helper.rb'
require 'emi_calculator'

RSpec.describe EmiCalculator::Calculator do
  let(:calc) { described_class.new(principal: 100000, annual_rate: 10, tenure_months: 12) }

  describe '#emi' do
    it "returns correct monthly emi" do
      # Manually Calculated
      expect(calc.emi).to eq(8791.59)
    end

    it "return 0 when annual_rate is 0" do
      zero_annual_rate = described_class.new(principal: 100000, annual_rate: 0, tenure_months: 12)
      expect(zero_annual_rate.emi).to eq(0.00)
    end

    it "return 0 when tenure_month is 0" do
      zero_tenure_month = described_class.new(principal: 100000, annual_rate: 10, tenure_months: 0)
      expect(zero_tenure_month.emi).to eq(0.00)
    end
  end

  describe '#monthly rate' do
    it "returns correct monthly rate" do
      # Manually Calculated
      expect(calc.monthly_rate.round(2)).to eq(0.01)
    end

    it "return 0 when annual_rate is 0" do
      zero_annual_rate = described_class.new(principal: 100000, annual_rate: 0, tenure_months: 12)
      expect(zero_annual_rate.monthly_rate).to eq(0.00)
    end
  end

  describe '#total_payment' do
    it "returns correct total payment" do
      # Manually Calculated
      expect(calc.total_payment).to eq(8791.59*calc.tenure_months)
    end

    it "return 0 when tenure_months is 0" do
      zero_tenure_month = described_class.new(principal: 100000, annual_rate: 10, tenure_months: 0)
      expect(zero_tenure_month.total_payment).to eq(0)
    end
  end

  describe '#total_interest' do
    it "returns correct total interest" do
      # Manually Calculated
      emi = calc.emi
      expect(calc.total_payment).to eq(emi*calc.tenure_months)
    end

    it "return 0 when tenure_months is 0" do
      zero_tenure_month = described_class.new(principal: 100000, annual_rate: 10, tenure_months: 0)
      expect(zero_tenure_month.total_interest).to eq(-100000)
    end
  end

  describe '#amortization_schedule' do
    it "returns correct amortization schedule" do
      # Manually Calculated
      expect(calc.amortization_schedule.count).to eq(12)
    end

    it "return 0 when amortization schedule is 0" do
      zero_tenure_month = described_class.new(principal: 100000, annual_rate: 10, tenure_months: 0)
      expect(zero_tenure_month.amortization_schedule.any?).to be false
    end
  end
end

