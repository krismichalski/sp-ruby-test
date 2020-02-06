#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/parser'
require 'optparse'
require 'ostruct'

options = OpenStruct.new
options.mode = :total

OptionParser.new do |opts|
  opts.banner = "Usage: parser.rb <path to file> [options]"
  opts.separator ""
  opts.separator "Specific options:"

  opts.on("--mode [MODE]", [:total, :unique], "Select mode: 'total' (default) or 'unique'") do |mode|
    options.mode = mode
  end

  opts.separator ""
  opts.separator "Common options:"

  opts.on_tail("-h", "--help", "Show this message") do
    puts opts
    exit
  end
end.parse!

puts "#{options[:mode].to_s.upcase}:"
Parser.new(file_path: ARGV[0], mode: options[:mode]).call
