module FitnessCalculator
  module WeightTraining
    class WorkoutSets
      def self.generate_drop_set(start:, set_count:, percent_decrease:, include_start_value: true)
        unless percent_decrease > 0 && percent_decrease < 1
          raise ArgumentError.new("percent_decrease must be > 0 and < 1")
        end

        current_weight = start
        mul = 1 - percent_decrease

        results = 2.upto(set_count).map do |set|
          tmp = current_weight * mul
          current_weight = tmp
          tmp
        end

        results.unshift(start) if include_start_value
        results
      end
    end
  end
end
