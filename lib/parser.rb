# frozen_string_literal: true

require_relative "smart_pension_ruby_test"

class Parser
  MODES = {
    total: {
      counter: Counter::Total,
      formatter: Formatter::Total,
    },
    unique: {
      counter: Counter::Unique,
      formatter: Formatter::Unique,
    },
  }.freeze

  def self.run(input_path:, mode:)
    mode_settings = MODES[mode]

    SmartPensionRubyTest.new(
      input_path: input_path,
      counter: mode_settings[:counter],
      formatter: mode_settings[:formatter],
    ).call
  end
end
