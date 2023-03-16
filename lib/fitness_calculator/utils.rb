module FitnessCalculator
  module Utils
    def self.normalize_sex(sex:)
      case sex.to_s.downcase
      when "male", "m", "man"
        :male
      when "female", "f", "w", "woman"
        :female
      end
    end
  end
end