require "formatter/unique"

RSpec.describe Formatter::Unique do
  let(:unique_formatter) { described_class.new(path: path, number_of_visits: number_of_visits) }

  let(:path) { "/path/1" }
  let(:number_of_visits) { 44 }

  describe "#format" do
    subject { unique_formatter.format }

    it { is_expected.to eq("/path/1 44 unique views") }
  end
end
