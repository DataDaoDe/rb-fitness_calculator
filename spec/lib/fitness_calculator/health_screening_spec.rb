# frozen_string_literal: true

RSpec.describe FitnessCalculator::HealthScreening do

  describe FitnessCalculator::HealthScreening::BMI do
    let(:subject) { FitnessCalculator::HealthScreening::BMI }
    it "should calculate BMI using metric units" do
      bmi = subject.bmi(mass_kg: 100, height_cm: 195)
      expect(bmi.to_i).to eq(26)
    end

    it "should calculate BMI using US units (pounds and inches)" do
      bmi = subject.bmi_imperial(mass_lb: 200, height_in: 76)
      expect(bmi.to_i).to eq(24)
    end

    it "should calculate healthy weight levels given a bmi" do
      h1 = subject.healthy_weight(bmi: 15)
      expect(h1).to eq([:underweight, :severe_thinness])
    end
  end
end
