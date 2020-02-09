class SimpleLogParser
  def initialize(log_lines:, storage:)
    @log_lines = log_lines
    @storage = storage
  end

  def call
    @log_lines.each do |line|
      path, ip = line.split(" ")
      @storage[path] <<= ip
    end
  end
end
