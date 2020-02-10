# frozen_string_literal: true

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

class SmartPensionRubyTest
  def initialize(input_path:, input_reader: nil, processor: nil, counter: nil, sorter: nil, formatter: nil, writer: nil)
    @input_path = input_path || raise("Path to input not provided!")
    @input_reader = input_reader || Reader::File
    @processor = processor || Processor::SimpleLog
    @counter = counter || Counter::Total
    @sorter = sorter || Sorter::Descending
    @formatter = formatter || Formatter::Total
    @writer = writer || Writer::StandardOutput
  end

  def call
    read
      .then { |lines| process_and_store(lines: lines) }
      .then { |storage| count(storage: storage) }
      .then { |storage| sort(storage: storage) }
      .then { |storage| format(storage: storage) }
      .then { |storage| write(storage: storage) }
  end

  private

  def read
    @input_reader.call(input_path: @input_path)
  end

  def process_and_store(lines:)
    @processor.call(lines: lines)
  end

  def count(storage:)
    @counter.call(storage: storage)
  end

  def sort(storage:)
    @sorter.call(storage: storage)
  end

  def format(storage:)
    @formatter.call(storage: storage)
  end

  def write(storage:)
    @writer.call(storage: storage)
  end
end
