# frozen_string_literal: true

require_relative "fitness_calculator/version"

module FitnessCalculator

  module HealthScreening
    autoload :BMI, "fitness_calculator/health_screening/bmi"
  end

  module WeightTraining
    autoload :OneRepMax, "fitness_calculator/weight_training/one_rep_max"
  end
end
