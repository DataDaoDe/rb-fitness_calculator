# frozen_string_literal: true

module FitnessCalculator
  autoload :Utils, "fitness_calculator/utils"
  autoload :VERSION, "fitness_calculator/version"
  autoload :Convert, "fitness_calculator/convert"

  module Health
    autoload :BMI, "fitness_calculator/health/bmi"
    autoload :BMR, "fitness_calculator/health/bmr"
  end

  module WeightTraining
    autoload :OneRepMax, "fitness_calculator/weight_training/one_rep_max"
    autoload :WorkoutSets, "fitness_calculator/weight_training/workout_sets"
  end
end
