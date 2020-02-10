# frozen_string_literal: true

require_relative "smart_pension_ruby_test"
require_relative "reader/file"
require_relative "processor/simple_log"
require_relative "counter/base"
require_relative "counter/total"
require_relative "counter/unique"
require_relative "sorter/descending"
require_relative "formatter/base"
require_relative "formatter/total"
require_relative "formatter/unique"
require_relative "writer/standard_output"

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
