#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/smart_pension_ruby_test'
require 'optparse'
require 'ostruct'

MODES = {
  total: {
    counter: Counter::Total,
    formatter: Formatter::Total
  },
  unique: {
    counter: Counter::Unique,
    formatter: Formatter::Unique
  }
}.freeze

options = OpenStruct.new
options.mode = MODES.keys.first

OptionParser.new do |opts|
  opts.banner = "Usage: parser.rb <path to file> [options]"
  opts.separator ""
  opts.separator "Specific options:"

  opts.on("--mode [MODE]", MODES.keys, "Select mode: #{MODES.keys.join('/')}") do |mode|
    options.mode = mode
  end

  opts.separator ""
  opts.separator "Common options:"

  opts.on_tail("-h", "--help", "Show this message") do
    puts opts
    exit
  end
end.parse!

def run(input_path:, mode:)
  mode_settings = MODES[mode]

  SmartPensionRubyTest.new(
    input_path: input_path,
    counter: mode_settings[:counter],
    formatter: mode_settings[:formatter],
  ).call
end

# If run in shell and not in RSpec
if $0 == __FILE__
  run(input_path: ARGV[0], mode: options[:mode])
end
