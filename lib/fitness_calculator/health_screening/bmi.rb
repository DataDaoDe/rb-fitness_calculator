module FitnessCalculator
  module HealthScreening
    class BMI

      def self.bmi_metric(mass_kg:, height_cm:)
        (mass_kg / (height_cm / 100.0)**2)
      end

      def self.bmi_us(mass_lb:, height_in:)
        (mass_lb / (height_in**2)) * 703
      end

    end
  end
end