#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/parser'

puts "TOTAL:"
Parser.new(file_path: ARGV[0], mode: :total).call
puts "UNIQUE:"
Parser.new(file_path: ARGV[0], mode: :unique).call
