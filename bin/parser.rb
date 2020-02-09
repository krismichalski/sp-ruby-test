#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/parser'
require 'optparse'
require 'ostruct'

MODES = Parser::MODES.keys

options = OpenStruct.new
options.mode = MODES.first

OptionParser.new do |opts|
  opts.banner = "Usage: parser.rb <path to file> [options]"
  opts.separator ""
  opts.separator "Specific options:"

  opts.on("--mode [MODE]", MODES, "Select mode: #{MODES.join('/')}") do |mode|
    options.mode = mode
  end

  opts.separator ""
  opts.separator "Common options:"

  opts.on_tail("-h", "--help", "Show this message") do
    puts opts
    exit
  end
end.parse!

def run(file_path:, mode:)
  Parser.new(file_path: file_path, mode: mode).call
end

# If run in shell and not in RSpec
if $0 == __FILE__
  run(file_path: ARGV[0], mode: options[:mode])
end
