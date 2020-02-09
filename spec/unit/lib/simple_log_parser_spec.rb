require "simple_log_parser"

RSpec.describe SimpleLogParser do
  let(:simple_log_parser) { described_class.new(log_lines: log_lines) }
  let(:log_lines) do
    [
      "/help_page/1 8.8.8.8",
      "/help_page/1 8.8.8.8",
      "/help_page/1 4.4.4.4",
      "/help_page/1 4.4.4.4",
      "/home 8.8.8.8",
      "/home 4.4.4.4",
      "/home 2.2.2.2",
      "/contact 8.8.8.8",
      "/index 2.2.2.2",
    ]
  end

  describe "#call" do
    subject { simple_log_parser.call }

    it "returns a Hash with path as keys and array of ips as values" do
      expect(subject).to eq(
        {
          "/help_page/1" => %w(8.8.8.8 8.8.8.8 4.4.4.4 4.4.4.4),
          "/home" => %w(8.8.8.8 4.4.4.4 2.2.2.2),
          "/contact" => %w(8.8.8.8),
          "/index" => %w(2.2.2.2),
        }
      )
    end
  end
end
