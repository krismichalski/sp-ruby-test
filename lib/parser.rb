class Parser
  MODES = {
    total: ->(array) { array.size },
    unique: ->(array) { array.uniq.size }
  }.freeze

  def initialize(file_path:, mode:)
    @file_path = file_path
    @mode = mode
  end

  def call
    fetch_visits.
      then { |visits| count_visits(visits: visits) }.
      then { |visits| sort_visits(visits: visits) }.
      then { |visits| display_visits(visits: visits) }
  end

  private

  def fetch_visits
    visits = Hash.new { [] }

    File.foreach(@file_path) do |line|
      path, ip = line.split(" ")
      visits[path] <<= ip
    end

    visits
  end

  def count_visits(visits:)
    visits.map do |path, ips_array|
      [path, MODES[@mode].call(ips_array)]
    end
  end

  def sort_visits(visits:)
    visits.sort_by { |_path, view_count| -view_count }
  end

  def display_visits(visits:)
    visits.each do |path, view_count|
      puts "#{path} #{view_count} visits"
    end
  end
end
