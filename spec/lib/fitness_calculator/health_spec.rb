# frozen_string_literal: true

RSpec.describe FitnessCalculator::Health do
  describe FitnessCalculator::Health::BMI do
    let(:subject) { FitnessCalculator::Health::BMI }
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

  describe FitnessCalculator::Health::BMR do
    let(:subject) { FitnessCalculator::Health::BMR }
    it "should calculate harris-benedict BMR for males" do
      b1 = subject.harris_benedict(mass_kg: 100, height_cm: 190, age: 40, sex: "m")
      expect(b1.to_i).to eq(2122)
    end

    it "should calculate harris-benedict BMR for females" do
      b1 = subject.harris_benedict(mass_kg: 100, height_cm: 190, age: 40, sex: "f")
      expect(b1.to_i).to eq(1775)
    end

    it "should calculate the revised harris-benedict BMR for males" do
      b1 = subject.revised_harris_benedict(mass_kg: 100, height_cm: 190, age: 40, sex: "m")
      expect(b1.round.to_i).to eq(2113)
    end

    it "should calculate revised harris-benedict BMR for females" do
      b1 = subject.revised_harris_benedict(mass_kg: 100, height_cm: 190, age: 40, sex: "f")
      expect(b1.round.to_i).to eq(1788)
    end
  end
end
