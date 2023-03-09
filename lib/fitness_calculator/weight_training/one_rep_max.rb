module FitnessCalculator
  module WeightTraining
    class OneRepMax
      # see: https://en.wikipedia.org/wiki/One-repetition_maximum

      def self.percentages(weight:, reps:, step_size: 10, alg: :epley)
        one_rm = self.send(alg, weight:, reps:).to_i
        (step_size..100).step(step_size).map do |s|
          p = s / 100.0
          (p * one_rm).round
        end
      end

      def self.epley(weight:, reps:)
        weight * ( 1.0 + (reps / 30.0))
      end

      def self.brzycki(weight:, reps:)
        weight * (36.0 / (37.0 - reps))
      end

      def self.adams(weight:, reps:)
        weight * (1.0 / (1.0 - (0.02 * reps)))
      end

      def self.landers(weight:, reps:)
        weight * (1.0 / (1.013 - 0.0267123 * reps))
      end

      def self.berger(weight:, reps:)
        weight * (1.0 / (1.0261 * Math.exp(-0.00262 * reps)))
      end

      def self.wathen(weight:, reps:)
        weight * (1.0 / (0.488 + (0.538*Math.exp(-0.075 * reps))))
      end
    end
  end
end