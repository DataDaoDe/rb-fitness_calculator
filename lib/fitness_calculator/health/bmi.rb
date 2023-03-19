module FitnessCalculator
  module Health
    class BMI
      # see: https://en.wikipedia.org/wiki/Body_mass_index

      def self.bmi(mass_kg:, height_cm:)
        (mass_kg / (height_cm / 100.0)**2)
      end

      # see: Frankel & Staeheli
      # doi: https://doi.org/10.7326/0003-4819-118-3-199302010-00025
      def self.bmi_imperial(mass_lb:, height_in:)
        (mass_lb / (height_in**2).to_f) * 703.0
      end

      # Uses the definitions as given by the WHO
      # given in the SuRF Report 2005.
      # see: https://apps.who.int/iris/bitstream/handle/10665/43190/9241593024_eng.pdf
      def self.healthy_weight(bmi:)
        if bmi < 16.0
          [:underweight, :severe_thinness]
        elsif bmi >= 16.0 && bmi < 17.0
          [:underweight, :moderate_thinness]
        elsif bmi >= 17.0 && bmi < 18.5
          [:underweight, :mild_thinness]
        elsif bmi >= 18.5 && bmi < 25.0
          [:normal]
        elsif bmi >= 25.0 && bmi < 30.0
          [:overweight, :pre_obese]
        elsif bmi >= 30.0 && bmi < 35.0
          [:obese, :class1]
        elsif bmi >= 35.0 && bmi < 40.0
          [:obese, :class2]
        else
          # bmi >= 40.0
          [:obese, :class3]
        end
      end
    end
  end
end
