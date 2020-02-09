class SimpleLogParser
  def initialize(log_lines:)
    @log_lines = log_lines
    @storage = Hash.new { [] }
  end

  def call
    @log_lines.each do |line|
      path, ip = line.split(" ")
      @storage[path] <<= ip
    end

    @storage
  end
end
