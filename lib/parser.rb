require_relative 'file_reader'
require_relative 'simple_log_parser'
require_relative 'counter/total'
require_relative 'counter/unique'
require_relative 'formatter/total'
require_relative 'formatter/unique'

class Parser
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

  def initialize(file_path:, mode:)
    @file_path = file_path
    @mode = mode
  end

  def call
    fetch_visits.
      then { |visits| parse_visits(visits: visits) }.
      then { |visits| count_visits(visits: visits) }.
      then { |visits| sort_visits(visits: visits) }.
      then { |visits| display_visits(visits: visits) }
  end

  private

  def fetch_visits
    FileReader.new(file_path: @file_path).call
  end

  def parse_visits(visits:)
    SimpleLogParser.new(log_lines: visits).call
  end

  def count_visits(visits:)
    visits.map do |path, ips_array|
      [path, MODES[@mode][:counter].new(ips_array: ips_array).count]
    end
  end

  def sort_visits(visits:)
    visits.sort_by { |_path, view_count| -view_count }
  end

  def display_visits(visits:)
    visits.each do |path, view_count|
      puts MODES[@mode][:formatter].new(path: path, number_of_visits: view_count).format
    end
  end
end
