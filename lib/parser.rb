class Parser
  def initialize(file_path:, mode:)
    @file_path = file_path
    @mode = mode
  end

  def call
    print
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

  def count
    fetch_visits.each_with_object({}) do |(path, ips_array), views|
      if @mode == :unique
        views[path] = ips_array.uniq.size
      else
        views[path] = ips_array.size
      end
    end
  end

  def sort
    count.sort_by { |_path, view_count| -view_count }
  end

  def print
    sort.each do |path, view_count|
      puts "#{path} #{view_count} visits"
    end
  end
end
