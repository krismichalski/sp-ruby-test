class FileReader
  def initialize(file_path:)
    @file_path = file_path
  end

  def call
    raise "Couldn't find file in the given path: #{@file_path}" unless File.exist?(@file_path)

    read_file
  end

  private

  def read_file
    lines = []

    File.foreach(@file_path) do |line|
      lines << line.strip
    end

    lines
  end
end
