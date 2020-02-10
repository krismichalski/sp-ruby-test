#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative "../lib/parser"
require "optparse"
require "ostruct"

options = OpenStruct.new
options.mode = Parser::MODES.keys.first

OptionParser.new do |opts|
  opts.banner = "Usage: parser.rb <path to file> [options]"
  opts.separator ""
  opts.separator "Specific options:"

  opts.on("--mode [MODE]", Parser::MODES.keys, "Select mode: #{Parser::MODES.keys.join('/')}") do |mode|
    options.mode = mode
  end

  opts.separator ""
  opts.separator "Common options:"

  opts.on_tail("-h", "--help", "Show this message") do
    puts opts
    exit
  end
end.parse!

Parser.run(input_path: ARGV[0], mode: options[:mode])
