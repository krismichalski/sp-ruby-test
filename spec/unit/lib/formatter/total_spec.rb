require "formatter/total"

RSpec.describe Formatter::Total do
  let(:total_formatter) { described_class.new(path: path, number_of_visits: number_of_visits) }

  let(:path) { "/path/1" }
  let(:number_of_visits) { 44 }

  describe "#format" do
    subject { total_formatter.format }

    it { is_expected.to eq("/path/1 44 visits") }
  end
end
