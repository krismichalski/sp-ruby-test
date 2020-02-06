#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative '../lib/parser'

Parser.new(file_path: ARGV[0]).call
