module Reader
  class File
    def self.call(input_path:)
      new.call(input_path: input_path)
    end

    def call(input_path:)
      raise "Couldn't find file in the given path: #{input_path}" unless ::File.exist?(input_path)

      read_file(input_path: input_path)
    end

    private

    def read_file(input_path:)
      lines = []

      ::File.foreach(input_path) do |line|
        lines << line.strip
      end

      lines
    end
  end
end
