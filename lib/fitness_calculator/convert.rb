require "ruby-units"

module FitnessCalculator
  module Convert
    # see: https://github.com/olbrich/ruby-units
    def self.units(from:, to:)
      Unit.new(from).convert_to(to).round.scalar.to_int
    end

    def self.convert(value:, value_units:, to_units:)
      Unit.new("#{value} #{value_units}").convert_to(to_units).round.scalar.to_int
    end
  end
end
