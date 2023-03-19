# frozen_string_literal: true

RSpec.describe FitnessCalculator::WeightTraining do
  describe FitnessCalculator::WeightTraining::WorkoutSets do
    let(:subject) { FitnessCalculator::WeightTraining::WorkoutSets }

    it "should generate a drop set" do
      seq = subject.generate_drop_set(
        start: 100,
        set_count: 5,
        percent_decrease: 0.2
      ).map(&:round)
      expect(seq).to eq([100, 80, 64, 51, 41])
    end

  end
end
