# frozen_string_literal: true

RSpec.describe FitnessCalculator::Convert do
  describe FitnessCalculator::Convert do
    let(:subject) { FitnessCalculator::Convert }

    describe "#units" do
      it "should convert kilograms to pounds" do
        t = [
          {value: "100 kg", result: 220},
          {value: "165.5 kg", result: 365}
        ]

        t.each do |ti|
          expect(subject.units(from: ti[:value], to: "lbs")).to eq(ti[:result])
        end
      end

      it "should convert pounds to kilograms" do
        t = [
          {value: "220 lbs", result: 100},
          {value: "365 lbs", result: 166}
        ]

        t.each do |ti|
          expect(subject.units(from: ti[:value], to: "kg")).to eq(ti[:result])
        end
      end
    end

    describe "#convert" do
      it "should convert from a value in given units to other units" do
        t = [
          {value: 220, value_units: "lbs", to_units: "kg", result: 100},
          {value: 100, value_units: "kg", to_units: "lb", result: 220}
        ]

        t.each do |ti|
          expect(subject.convert(
            value: ti[:value],
            value_units: ti[:value_units],
            to_units: ti[:to_units]
          )).to eq(ti[:result])
        end
      end
    end
  end
end
