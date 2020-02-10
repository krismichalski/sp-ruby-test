# frozen_string_literal: true

RSpec.describe Processor::SimpleLog do
  subject { described_class.call(lines: lines) }

  let(:lines) do
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
    it "returns a Hash with path as keys and array of ips as values" do
      expect(subject).to eq(
        "/help_page/1" => %w[8.8.8.8 8.8.8.8 4.4.4.4 4.4.4.4],
        "/home" => %w[8.8.8.8 4.4.4.4 2.2.2.2],
        "/contact" => %w[8.8.8.8],
        "/index" => %w[2.2.2.2],
      )
    end
  end
end
