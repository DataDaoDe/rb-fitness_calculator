# frozen_string_literal: true

require_relative "fitness_calculator/version"

module FitnessCalculator
  autoload :Utils, "fitness_calculator/utils"

  module Health
    autoload :BMI, "fitness_calculator/health/bmi"
    autoload :BMR, "fitness_calculator/health/bmr"
  end

  module WeightTraining
    autoload :OneRepMax, "fitness_calculator/weight_training/one_rep_max"
    autoload :WorkoutSets, "fitness_calculator/weight_training/workout_sets"
  end
end
