module FitnessCalculator
  module Health
    class BMR
      # see: https://en.wikipedia.org/wiki/Basal_metabolic_rate
      # Basal Metabolic Rate
      #
      # The rate of energy expenditure per unit time while at rest.

      # see: https://en.wikipedia.org/wiki/Harris%E2%80%93Benedict_equation
      # results are in kcal/day
      def self.harris_benedict(mass_kg:, height_cm:, age:, sex:)
        case Utils.normalize_sex(sex:)
        when :male
          harris_benedict_male(mass_kg:, height_cm:, age:)
        when :female
          harris_benedict_female(mass_kg:, height_cm:, age:)
        else
          raise ArgumentError.new("invalid value given for sex: #{sex}, use 'm' or 'f'")
        end
      end

      def self.harris_benedict_male(mass_kg:, height_cm:, age:)
        66.473 + (13.7516 * mass_kg) + (5.0033 * height_cm) - (6.755 * age)
      end

      def self.harris_benedict_female(mass_kg:, height_cm:, age:)
        655.0955 + (9.5634 * mass_kg) + (1.8496 * height_cm) - (4.6756 * age)
      end

      # see: https://pubmed.ncbi.nlm.nih.gov/11817239/
      # more accurate than harris-benedict
      def self.revised_harris_benedict(mass_kg:, height_cm:, age:, sex:)
        case Utils.normalize_sex(sex:)
        when :male
          revised_harris_benedict_male(mass_kg:, height_cm:, age:)
        when :female
          revised_harris_benedict_female(mass_kg:, height_cm:, age:)
        else
          raise ArgumentError.new("invalid value given for sex: #{sex}, use 'm' or 'f'")
        end
      end

      def self.revised_harris_benedict_male(mass_kg:, height_cm:, age:)
        88.362 + (13.397 * mass_kg) + (4.799 * height_cm) - (5.677 * age)
      end

      def self.revised_harris_benedict_female(mass_kg:, height_cm:, age:)
        447.593 + (9.247 * mass_kg) + (3.098 * height_cm) - (4.33 * age)
      end
    end
  end
end
