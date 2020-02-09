module Parser
  class SimpleLog
    def initialize
      @storage = Hash.new { [] }
    end

    def self.call(lines:)
      new.call(lines: lines)
    end

    def call(lines:)
      lines.each_with_object(@storage) do |line, storage|
        path, ip = line.split(" ")
        storage[path] <<= ip
      end
    end
  end
end
